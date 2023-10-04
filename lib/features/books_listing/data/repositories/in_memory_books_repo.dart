import 'package:event_bus/event_bus.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/book.dart';
import '../../domain/repositories/books_repository.dart';
import '../../presentation/bloc/books_bloc.dart';

final class InMemoryBooksRepo implements BooksRepository {
  InMemoryBooksRepo(this.eventBus);

  @override
  Future<Result<Unit, Failure>> add(Book book) {
    _allBooks.add(book);
    eventBus.fire(BookSaved());
    return Future.value(const Success(unit));
  }

  @override
  Future<Result<List<Book>, Failure>> listAll() {
    return Future.value(Success(List.of(_allBooks)));
  }

  @override
  Future<Result<List<Book>, Failure>> search(String query) {
    return Future.value(Success(List.of(_foundBooks)));
  }

  @override
  Future<Result<Unit, Failure>> swap(Book book, Book withCopy) {
    _allBooks.remove(book);
    _allBooks.add(withCopy);
    return Future.value(const Success(unit));
  }

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

  final _foundBooks = [
    Book.fake(withTags: false),
    Book.fake(withTags: false),
    Book.fake(withTags: false),
    Book.fake(withTags: false),
    Book.fake(withTags: false),
  ];

  final EventBus eventBus;
}
