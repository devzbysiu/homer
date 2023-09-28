import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/repository/books_repository.dart';

class ListBooksUseCase extends UseCase<List<BookEntity>, BookState> {
  ListBooksUseCase({required this.repo});

  final BooksRepository repo;

  @override
  List<BookEntity> call(BookState state) {
    return repo.findAll().where((b) => b.state == state).toList();
  }
}

abstract class UseCase<T, U> {
  T call(U state);
}