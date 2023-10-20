import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/mappers/local_books_mapper.dart';
import '../../../book_summary/domain/entities/local_book.dart';
import '../../domain/repositories/local_books_repository.dart';
import '../datasources/local_books_data_source.dart';

final class LocalBooksRepo implements LocalBooksRepository {
  LocalBooksRepo({required this.dataSource});

  final LocalBooksDataSource dataSource;

  @override
  Future<Result<List<LocalBook>, Failure>> listAll() async {
    final bookDTOs = await dataSource.getBooks();
    final books = toLocalBooks(bookDTOs);
    return Future.value(Success(books));
  }

  @override
  Future<Result<Unit, Failure>> add(LocalBook book) async {
    final bookDTO = toLocalBookDTO(book);
    await dataSource.add(bookDTO);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> addAll(List<LocalBook> books) async {
    final bookDTOs = toLocalBookDTOs(books);
    await dataSource.addAll(bookDTOs);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> update(LocalBook modified) async {
    final bookDTO = toLocalBookDTO(modified);
    await dataSource.update(bookDTO);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> delete(List<LocalBook> books) async {
    final bookDTOs = toLocalBookDTOs(books);
    await dataSource.delete(bookDTOs);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> deleteAll() async {
    await dataSource.deleteAll();
    return Future.value(const Success(unit));
  }
}
