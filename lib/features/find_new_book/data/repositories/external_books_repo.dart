import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../domain/entities/external_book_info.dart';
import '../../domain/repositories/external_books_repository.dart';
import '../datasources/external_books_data_source.dart';
import '../mappers/to_books.dart';

final class ExternalBooksRepo implements ExternalBooksRepository {
  ExternalBooksRepo({required this.booksDataSource});

  final ExternalBooksDataSource booksDataSource;

  @override
  Future<Result<List<Book>, Failure>> search(String query) async {
    if (query.trim().isEmpty) return Success(List.empty());
    try {
      final bookDTOs = await booksDataSource.getFromQuery(query);
      final books = toBooks(bookDTOs);
      return Success(books);
    } on BooksQueryException {
      return Error(SearchingForBooksFailure());
    }
  }

  @override
  Future<Result<Book, Failure>> fromBookInfo(ExternalBookInfo bookInfo) async {
    try {
      final bookDTO = await booksDataSource.getFromIsbn(bookInfo.isbn);
      final book = toBook(bookDTO);
      return Success(book);
    } on NoBookFoundException catch (e) {
      return Error(NoBookWithIsbnFailure(e.isbn));
    } on TooManyBooksFoundException catch (e) {
      return Error(TooManyBooksFoundFailure(e.isbn));
    }
  }
}
