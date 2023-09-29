part of 'books_bloc.dart';

@immutable
class BooksState {
  const BooksState(this.books);

  final List<BookEntity> books;
}
