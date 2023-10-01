part of 'books_bloc.dart';

@immutable
abstract class BooksEvent {}

class BookAdded extends BooksEvent {
  BookAdded(this.book);

  final BookEntity book;
}

class BookSwipedRight extends BooksEvent {
  BookSwipedRight(this.book);

  final BookEntity book;
}

class BookSwipedLeft extends BooksEvent {
  BookSwipedLeft(this.book);

  final BookEntity book;
}

final class BookSaved {}
