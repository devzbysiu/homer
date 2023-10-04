import 'package:homer/core/error/failure.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../domain/entities/book_entity.dart';
import '../../domain/repositories/books_repository.dart';

final class InMemoryBooksRepo implements BooksRepository {
  final _allBooks = [
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
  ];

  final _foundBooks = [
    BookEntity.fake(withTags: false),
    BookEntity.fake(withTags: false),
    BookEntity.fake(withTags: false),
    BookEntity.fake(withTags: false),
    BookEntity.fake(withTags: false),
  ];

  @override
  Future<Result<Unit, Failure>> add(BookEntity book) {
    _allBooks.add(book);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<List<BookEntity>, Failure>> listAll() {
    return Future.value(Success(List.of(_allBooks)));
  }

  @override
  Future<Result<List<BookEntity>, Failure>> search(String query) {
    return Future.value(Success(List.of(_foundBooks)));
  }

  @override
  Future<Result<Unit, Failure>> swap(BookEntity book, BookEntity withCopy) {
      _allBooks.remove(book);
      _allBooks.add(withCopy);
      return Future.value(const Success(unit));
  }
}
