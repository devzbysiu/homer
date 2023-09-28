import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/repository/book_repository.dart';

class InMemoryRepo extends BookRepository {
  final _forLater = [
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
  ];

  final _reading = [
    BookEntity.fake(),
    BookEntity.fake(),
  ];

  final _read = [
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
    BookEntity.fake(),
  ];

  @override
  List<BookEntity> findAllForLater() => _forLater;

  @override
  void addForLater(BookEntity book) => _forLater.add(book);

  @override
  List<BookEntity> findAllReading() => _reading;

  @override
  void addReading(BookEntity book) => _reading.add(book);

  @override
  List<BookEntity> findAllRead() => _read;

  @override
  void addRead(BookEntity book) => _read.add(book);
}
