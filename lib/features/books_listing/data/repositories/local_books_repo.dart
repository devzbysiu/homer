import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/local_book.dart';
import '../../domain/repositories/local_books_repository.dart';
import '../datasources/local_books_data_source.dart';
import '../mappers/local_book_mapper.dart';

final class LocalBooksRepo implements LocalBooksRepository {
  LocalBooksRepo({required this.dataSource, required this.bookMapper});

  final LocalBooksDataSource dataSource;

  final LocalBookMapper bookMapper;

  @override
  Future<Result<List<LocalBook>, Failure>> listAll() async {
    final bookDTOs = await dataSource.getBooks();
    final books = bookMapper.toBooks(bookDTOs);
    return Future.value(Success(books));
  }

  @override
  Future<Result<Unit, Failure>> add(LocalBook book) async {
    final bookDTO = bookMapper.toBookDTO(book);
    await dataSource.addBook(bookDTO);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> update(LocalBook modified) async {
    final bookDTO = bookMapper.toBookDTO(modified);
    await dataSource.update(bookDTO);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> delete(List<LocalBook> books) async {
    final bookDTOs = bookMapper.toBookDTOs(books);
    await dataSource.delete(bookDTOs);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> deleteAll() async {
    await dataSource.deleteAll();
    return Future.value(const Success(unit));
  }
}
