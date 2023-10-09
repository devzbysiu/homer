part of 'books_bloc.dart';

@immutable
abstract class BooksEvent extends Equatable {}

final class BookAdded extends BooksEvent {
  BookAdded(this.book, this.bookState, this.selectedTags);

  final RemoteBook book;

  final BookState bookState;

  final Set<Tag> selectedTags;

  @override
  List<Object?> get props => [book];
}

final class BookSwipedRight extends BooksEvent {
  BookSwipedRight(this.book);

  final LocalBook book;

  @override
  List<Object?> get props => [book];
}

final class BookSwipedLeft extends BooksEvent {
  BookSwipedLeft(this.book);

  final LocalBook book;

  @override
  List<Object?> get props => [book];
}

final class BooksListDisplayed extends BooksEvent {
  @override
  List<Object?> get props => [];
}

final class AppendToDeleteList extends BooksEvent {
  AppendToDeleteList(this.book);

  final LocalBook book;

  @override
  List<Object> get props => [book];
}

final class RemoveFromDeleteList extends BooksEvent {
  RemoveFromDeleteList(this.book);

  final LocalBook book;

  @override
  List<Object> get props => [book];
}

final class DeleteBooks extends BooksEvent {
  DeleteBooks(this.books);

  final List<LocalBook> books;

  @override
  List<Object?> get props => [books];
}

final class ClearDeletionList extends BooksEvent {
  @override
  List<Object?> get props => [];
}

final class BookSaved {}
