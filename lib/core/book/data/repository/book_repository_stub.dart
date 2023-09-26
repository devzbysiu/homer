import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/repository/book_repository.dart';

class BookRepositoryStub extends BookRepository {
  @override
  List<BookEntity> findAll() {
    return List.of([
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
      BookEntity.fake(),
    ]);
  }
}
