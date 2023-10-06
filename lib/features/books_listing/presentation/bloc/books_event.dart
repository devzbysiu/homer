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

final class BookSaved {}
