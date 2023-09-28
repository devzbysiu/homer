part of 'books_bloc.dart';

@immutable
abstract class BooksEvent {}

class BookAdded extends BooksEvent {
  BookAdded(this.book);

  final BookEntity book;
}

class BookSwipedRight extends BooksEvent {
  BookSwipedRight(this.book, {required this.from});

  final BookEntity book;

  final AppTab from;
}
