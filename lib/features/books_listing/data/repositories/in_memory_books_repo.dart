import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/local_book.dart';
import '../../domain/repositories/local_books_repository.dart';

final class InMemoryBooksRepo implements LocalBooksRepository {
  InMemoryBooksRepo();

  final _allBooks = [
    LocalBook.fake(),
    LocalBook.fake(),
    LocalBook.fake(),
    LocalBook.fake(),
    LocalBook.fake(),
    LocalBook.fake(),
    LocalBook.fake(),
    LocalBook.fake(),
    LocalBook.fake(),
    LocalBook.fake(),
  ];

  @override
  Future<Result<Unit, Failure>> add(LocalBook book) {
    _allBooks.add(book);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<List<LocalBook>, Failure>> listAll() {
    return Future.value(Success(List.of(_allBooks)));
  }

  @override
  Future<Result<Unit, Failure>> update(LocalBook modified) {
    _allBooks.removeWhere((book) => book.isbn == modified.isbn);
    _allBooks.add(modified);
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> delete(List<LocalBook> books) {
    for (var toRemove in books) {
      _allBooks.removeWhere((book) => book.isbn == toRemove.isbn);
    }
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<Unit, Failure>> deleteAll() {
    _allBooks.clear();
    return Future.value(const Success(unit));
  }
}
