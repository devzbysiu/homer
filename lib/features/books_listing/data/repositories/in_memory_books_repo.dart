import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/book.dart';
import '../../domain/repositories/books_repository.dart';

final class InMemoryBooksRepo implements BooksRepository {
  InMemoryBooksRepo();

  final _foundBooks = [
    Book.fake(withTags: false),
    Book.fake(withTags: false),
    Book.fake(withTags: false),
    Book.fake(withTags: false),
    Book.fake(withTags: false),
  ];

  final _allBooks = [
    Book.fake(),
    Book.fake(),
    Book.fake(),
    Book.fake(),
    Book.fake(),
    Book.fake(),
    Book.fake(),
    Book.fake(),
    Book.fake(),
    Book.fake(),
  ];

  @override
  Future<Result<Unit, Failure>> add(Book book) {
    _allBooks.add(book);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<List<Book>, Failure>> listAll() {
    return Future.value(Success(List.of(_allBooks)));
  }

  @override
  Future<Result<Unit, Failure>> update(Book modified) {
    _allBooks.removeWhere((book) => book.isbn == modified.isbn);
    _allBooks.add(modified);
    throw UnimplementedError();
  }

  @override
  Future<Result<Unit, Failure>> delete(List<Book> books) {
    // TODO: implement delete
    throw UnimplementedError();
  }

  @override
  Future<Result<List<Book>, Failure>> search(String query) {
    return Future.value(Success(List.of(_foundBooks)));
  }
}
