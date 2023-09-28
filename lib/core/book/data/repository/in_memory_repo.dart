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
  List<BookEntity> findAll() => _allBooks;

  bool _bookInForLater(BookEntity book) => book.state == BookState.readLater;

  bool _bookInReading(BookEntity book) => book.state == BookState.reading;

  bool _bookInRead(BookEntity book) => book.state == BookState.read;

  @override
  void add(BookEntity book) => _allBooks.add(book);
}
