import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/use_case/list_books_use_case.dart';

class BooksListController {
  BooksListController({required ListBooksUseCase useCase}) {
    _useCase = useCase;
  }

  late final ListBooksUseCase _useCase;

  List<BookEntity> getBooks(BookState state) => _useCase.call(state);
}
