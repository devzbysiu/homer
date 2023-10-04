part of 'books_bloc.dart';

@immutable
abstract class BooksEvent {}

final class BookAdded extends BooksEvent {
  BookAdded(this.book);

  final BookEntity book;
}

final class BookSwipedRight extends BooksEvent {
  BookSwipedRight(this.book);

  final BookEntity book;
}

final class BookSwipedLeft extends BooksEvent {
  BookSwipedLeft(this.book);

  final BookEntity book;
}

final class BooksListLoaded extends BooksEvent {}

final class BookSaved {}
