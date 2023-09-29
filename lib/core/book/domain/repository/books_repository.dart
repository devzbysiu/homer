import 'package:homer/core/book/domain/entity/book_entity.dart';

abstract class BooksRepository {
  List<BookEntity> listAll();

  void add(BookEntity book);

  void swap(BookEntity book, BookEntity withCopy);

  List<BookEntity> search(String query);
}
