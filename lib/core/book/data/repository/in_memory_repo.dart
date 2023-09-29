import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/repository/books_repository.dart';

class InMemoryRepo extends BooksRepository {
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

  @override
  List<BookEntity> findAll() => List.of(_allBooks);

  @override
  void add(BookEntity book) => _allBooks.add(book);

  @override
  void swap(BookEntity book, BookEntity withCopy) {
    _allBooks.remove(book);
    _allBooks.add(withCopy);
  }
}
