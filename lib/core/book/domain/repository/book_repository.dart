import 'package:homer/core/book/domain/entity/book_entity.dart';

abstract class BookRepository {

  List<BookEntity> findAll();

}