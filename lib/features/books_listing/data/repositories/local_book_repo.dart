import 'dart:async';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/book.dart';
import '../../domain/repositories/books_repository.dart';
import '../datasources/local_data_source.dart';
import '../mappers/book_mapper.dart';

final class LocalBooksRepo implements BooksRepository {
  LocalBooksRepo({required this.dataSource, required this.bookMapper});

  final LocalDataSource dataSource;

  final BookMapper bookMapper;

  final _foundBooks = [
    Book.fake(withTags: false),
    Book.fake(withTags: false),
    Book.fake(withTags: false),
    Book.fake(withTags: false),
    Book.fake(withTags: false),
  ];

  @override
  Future<Result<List<Book>, Failure>> listAll() async {
    final bookModels = await dataSource.getBooks();
    final books = bookMapper.toBooks(bookModels);
    return Future.value(Success(books));
  }

  @override
  Future<Result<Unit, Failure>> add(Book book) async {
    final bookDTO = bookMapper.toBookDTO(book);
    await dataSource.addBook(bookDTO);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> update(Book modified) async {
    final bookDto = bookMapper.toBookDTO(modified);
    await dataSource.update(bookDto);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<List<Book>, Failure>> search(String query) {
    return Future.value(Success(List.of(_foundBooks)));
  }
}
