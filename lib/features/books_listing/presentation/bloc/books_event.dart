part of 'books_bloc.dart';

@immutable
abstract class BooksEvent {}

final class BookAdded extends BooksEvent {
  BookAdded(this.book);

  final Book book;
}

final class BookSwipedRight extends BooksEvent {
  BookSwipedRight(this.book);

  final Book book;
}

final class BookSwipedLeft extends BooksEvent {
  BookSwipedLeft(this.book);

  final Book book;
}

final class BooksListDisplayed extends BooksEvent {}

final class BookSaved {}
