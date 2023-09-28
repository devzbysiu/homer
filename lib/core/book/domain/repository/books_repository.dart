import 'package:homer/core/book/domain/entity/book_entity.dart';

abstract class BooksRepository {
  List<BookEntity> findAll();

  void add(BookEntity book);
}
