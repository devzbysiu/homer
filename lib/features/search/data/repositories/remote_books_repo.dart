import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:homer/core/error/exceptions.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/mappers/remote_books_mapper.dart';
import '../../domain/entities/remote_book.dart';
import '../../domain/repositories/remote_books_repository.dart';
import '../datasources/remote_book_info_data_source.dart';
import '../datasources/remote_books_data_source.dart';
import '../models/remote_book_info_dto.dart';

final class RemoteBooksRepo implements RemoteBooksRepository {
  RemoteBooksRepo({
    required this.booksDataSource,
    required this.booksInfoDataSource,
  });

  final RemoteBooksDataSource booksDataSource;

  final RemoteBookInfoDataSource booksInfoDataSource;

  @override
  Future<Result<List<RemoteBook>, Failure>> search(String query) async {
    final bookDTOs = await booksDataSource.getFromQuery(query);
    final remoteBooks = toRemoteBooks(bookDTOs);
    return Future.value(Success(remoteBooks));
  }

  @override
  Future<Result<RemoteBook, Failure>> fromUrl(String url) async {
    try {
      final bookInfoDTO = await booksInfoDataSource.getFromUrl(url);
      final bookIsbn = _getIsbn(bookInfoDTO);
      if (bookIsbn.isNone()) return Future.value(Error(NoIsbnFailure(url)));

      final bookDTO = await booksDataSource.getFromIsbn(bookIsbn.toNullable()!);
      final remoteBook = toRemoteBook(bookDTO);
      return Future.value(Success(remoteBook));
    } on FormatException {
      return Future.value(Error(InvalidUrlSharedFailure(url)));
    } on NoBookWithIsbnFoundException catch (e) {
      return Future.value(Error(NoBookWithIsbnFailure(e.isbn)));
    } on TooManyBooksFoundException catch (e) {
      return Future.value(Error(TooManyBooksFoundFailure(e.isbn)));
    } on TimeoutException {
      return Future.value(const Error(TimeoutOnApiResponseFailure()));
    }
  }

  Option<String> _getIsbn(RemoteBookInfoDTO bookInfoDTO) {
    return bookInfoDTO.isbn10.orElse(() => bookInfoDTO.isbn13);
  }
}
