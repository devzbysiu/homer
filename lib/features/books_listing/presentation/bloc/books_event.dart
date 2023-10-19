part of 'books_bloc.dart';

@immutable
abstract class BooksEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class BookAdded extends BooksEvent {
  BookAdded(this.book, this.bookState, this.selectedTags);

  final RemoteBook book;

  final LocalBookState bookState;

  final Set<Tag> selectedTags;

  @override
  List<Object> get props => [book];
}

final class BookSwipedRight extends BooksEvent {
  BookSwipedRight(this.book);

  final LocalBook book;

  @override
  List<Object> get props => [book];
}

final class BookSwipedLeft extends BooksEvent {
  BookSwipedLeft(this.book);

  final LocalBook book;

  @override
  List<Object> get props => [book];
}

final class RefreshBooksList extends BooksEvent {}

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
  List<Object> get props => [books];
}

final class ClearDeletionList extends BooksEvent {}

final class TagToggled extends BooksEvent {
  TagToggled(this.book, this.tag);

  final LocalBook book;

  final Tag tag;
}

final class BooksFiltered extends BooksEvent {
  BooksFiltered(this.query);

  final String query;
}

final class ShowSummary extends BooksEvent {
  ShowSummary(this.book);

  final LocalBook book;
}

final class SummaryModeDisabled extends BooksEvent {}

final class BookSaved {}
