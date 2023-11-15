import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/books_repository.dart';
import '../datasources/books_data_source.dart';
import '../mappers/to_book_dtos.dart';
import '../mappers/to_books.dart';

final class BooksRepo implements BooksRepository {
  BooksRepo({required this.dataSource});

  final BooksDataSource dataSource;

  @override
  Future<Result<List<Book>, Failure>> listAll() async {
    final bookDTOs = await dataSource.getBooks();
    final books = toBooks(bookDTOs);
    return Future.value(Success(books));
  }

  @override
  Future<Result<Unit, Failure>> add(Book book) async {
    final bookDTO = toBookDTO(book);
    await dataSource.add(bookDTO);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> addAll(List<Book> books) async {
    final bookDTOs = toBookDTOs(books);
    await dataSource.addAll(bookDTOs);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> update(Book modified) async {
    final bookDTO = toBookDTO(modified);
    await dataSource.update(bookDTO);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> delete(List<Book> books) async {
    final bookDTOs = toBookDTOs(books);
    await dataSource.delete(bookDTOs);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> deleteAll() async {
    await dataSource.deleteAll();
    return Future.value(const Success(unit));
  }
}
