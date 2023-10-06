part of 'books_bloc.dart';

@immutable
abstract class BooksEvent extends Equatable {}

final class BookAdded extends BooksEvent {
  BookAdded(this.book);

  final Book book;

  @override
  List<Object?> get props => [book];
}

final class BookSwipedRight extends BooksEvent {
  BookSwipedRight(this.book);

  final Book book;

  @override
  List<Object?> get props => [book];
}

final class BookSwipedLeft extends BooksEvent {
  BookSwipedLeft(this.book);

  final Book book;

  @override
  List<Object?> get props => [book];
}

final class BooksListDisplayed extends BooksEvent {
  @override
  List<Object?> get props => [];
}

final class ToggleDeletionMode extends BooksEvent {
  ToggleDeletionMode(this.book);

  final Book book;

  @override
  List<Object> get props => [book];
}

final class DeleteBooks extends BooksEvent {
  DeleteBooks(this.books);

  final List<Book> books;

  @override
  List<Object?> get props => [books];
}

final class ClearDeletionList extends BooksEvent {
  @override
  List<Object?> get props => [];
}

final class BookSaved {}
