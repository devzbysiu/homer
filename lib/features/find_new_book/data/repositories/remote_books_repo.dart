import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/remote_books_repository.dart';
import '../datasources/remote_book_info_data_source.dart';
import '../datasources/remote_books_data_source.dart';
import '../mappers/to_books.dart';
import '../models/book_info_dto.dart';

final class RemoteBooksRepo implements RemoteBooksRepository {
  RemoteBooksRepo({
    required this.booksDataSource,
    required this.booksInfoDataSource,
  });

  final RemoteBooksDataSource booksDataSource;

  final RemoteBookInfoDataSource booksInfoDataSource;

  @override
  Future<Result<List<Book>, Failure>> search(String query) async {
    final bookDTOs = await booksDataSource.getFromQuery(query);
    final books = toBooks(bookDTOs);
    return Future.value(Success(books));
  }

  @override
  Future<Result<Book, Failure>> fromUrl(String url) async {
    try {
      final bookInfoDTO = await booksInfoDataSource.getFromUrl(url);
      final bookIsbn = _getIsbn(bookInfoDTO);
      if (bookIsbn.isNone()) return Future.value(Error(NoIsbnFailure(url)));

      final bookDTO = await booksDataSource.getFromIsbn(bookIsbn.toNullable()!);
      final remoteBook = toBook(bookDTO);
      return Future.value(Success(remoteBook));
    } on InvalidUrlException catch (e) {
      return Future.value(Error(InvalidUrlSharedFailure(e.url)));
    } on IncorrectResponseException {
      return Future.value(Error(ServerFailure()));
    } on InvalidJsonException catch (_) {
      return Future.value(Error(ServerFailure()));
    } on TimeoutException {
      return Future.value(const Error(TimeoutOnApiResponseFailure()));
    } on NoBookWithIsbnFoundException catch (e) {
      return Future.value(Error(NoBookWithIsbnFailure(e.isbn)));
    } on TooManyBooksFoundException catch (e) {
      return Future.value(Error(TooManyBooksFoundFailure(e.isbn)));
    }
  }

  Option<String> _getIsbn(BookInfoDTO bookInfoDTO) {
    return bookInfoDTO.isbn10.orElse(() => bookInfoDTO.isbn13);
  }
}
