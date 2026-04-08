import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/exceptions.dart';
import '../../../../core/error/failures.dart';
import '../../../../logger.dart';
import '../../domain/repositories/external_books_repository.dart';
import '../datasources/external_books_data_source.dart';
import '../mappers/to_books.dart';

final class ExternalBooksRepo implements ExternalBooksRepository {
  ExternalBooksRepo({required this.dataSource});

  final ExternalBooksDataSource dataSource;

  @override
  Future<Result<List<Book>, Failure>> search(String query) async {
    if (query.trim().isEmpty) return Success(List.empty());
    try {
      final bookDTOs = await dataSource.getFromQuery(query);
      final books = toBooks(bookDTOs);
      return Success(books);
    } on BooksQueryException catch (e, st) {
      log.handle(e, st, 'Failed to search using query "$query"');
      return Error(SearchingForBooksFailure());
    }
  }

  @override
  Future<Result<Book, Failure>> fromIsbn(String isbn) async {
    try {
      final bookDTO = await dataSource.getFromIsbn(isbn);
      final book = toBook(bookDTO);
      return Success(book);
    } on NoBookFoundException catch (e, st) {
      log.handle(e, st, 'Failed to get data from isbn "$isbn"');
      return Error(NoBookWithIsbnFailure(e.isbn));
    } on TooManyBooksFoundException catch (e) {
      return Error(TooManyBooksFoundFailure(e.isbn));
    }
  }
}
