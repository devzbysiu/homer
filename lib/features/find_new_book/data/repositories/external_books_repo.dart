import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/external_books_repository.dart';
import '../datasources/external_book_info_data_source.dart';
import '../datasources/external_books_data_source.dart';
import '../mappers/to_books.dart';
import '../models/external_book_info_dto.dart';

final class ExternalBooksRepo implements ExternalBooksRepository {
  ExternalBooksRepo({
    required this.booksDataSource,
    required this.bookInfoDataSource,
  });

  final ExternalBooksDataSource booksDataSource;

  final ExternalBookInfoDataSource bookInfoDataSource;

  @override
  Future<Result<List<Book>, Failure>> search(String query) async {
    if (query.trim().isEmpty) return Future.value(Success(List.empty()));
    try {
      final bookDTOs = await booksDataSource.getFromQuery(query);
      final books = toBooks(bookDTOs);
      return Future.value(Success(books));
    } on BooksQueryException {
      return Future.value(Error(SearchingForBooksFailure()));
    }
  }

  @override
  Future<Result<Book, Failure>> fromUrl(String url) async {
    if (url.trim().isEmpty) {
      return Future.value(
        Error(InvalidUrlSharedFailure(url)),
      );
    }

    ExternalBookInfoDTO bookInfoDTO;
    try {
      bookInfoDTO = await bookInfoDataSource.getFromUrl(url);
    } on InvalidUrlException catch (e) {
      return Future.value(Error(InvalidUrlSharedFailure(e.url)));
    } on NotJsonException {
      return Future.value(Error(ServerFailure()));
    } on WrongJsonException catch (_) {
      return Future.value(Error(ServerFailure()));
    } on TimeoutException {
      return Future.value(const Error(TimeoutOnApiResponseFailure()));
    }

    try {
      final bookIsbn = bookInfoDTO.isbn;
      if (bookIsbn.isNone()) return Future.value(Error(NoIsbnFailure(url)));

      final bookDTO = await booksDataSource.getFromIsbn(bookIsbn.toNullable()!);
      final book = toBook(bookDTO);
      return Future.value(Success(book));
    } on NoBookFoundException catch (e) {
      return Future.value(Error(NoBookWithIsbnFailure(e.isbn)));
    } on TooManyBooksFoundException catch (e) {
      return Future.value(Error(TooManyBooksFoundFailure(e.isbn)));
    }
  }
}
