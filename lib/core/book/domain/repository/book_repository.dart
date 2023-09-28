import 'package:homer/core/book/domain/entity/book_entity.dart';

abstract class BookRepository {

  List<BookEntity> findAllForLater();
  void addForLater(BookEntity book);

  List<BookEntity> findAllReading();
  void addReading(BookEntity book);

  List<BookEntity> findAllRead();
  void addRead(BookEntity book);

}