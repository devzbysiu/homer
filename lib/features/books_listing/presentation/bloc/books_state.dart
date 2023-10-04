part of 'books_bloc.dart';

@immutable
final class BooksState {
  const BooksState(this.books);

  final List<BookEntity> books;
}
