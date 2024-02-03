part of 'books_bloc.dart';

@immutable
abstract class BooksEvent extends Equatable implements BusEvent {
  @override
  List<Object> get props => [];
}

final class SaveBook extends BooksEvent {
  SaveBook(this.book, this.bookState, this.selectedTags);

  final Book book;

  final BookState bookState;

  final List<Tag> selectedTags;

  @override
  List<Object> get props => [book];
}

final class BookSwipedRight extends BooksEvent {
  BookSwipedRight(this.book);

  final Book book;

  @override
  List<Object> get props => [book];
}

final class BookSwipedLeft extends BooksEvent {
  BookSwipedLeft(this.book);

  final Book book;

  @override
  List<Object> get props => [book];
}

final class RefreshBooksList extends BooksEvent {}

final class TagToggled extends BooksEvent {
  TagToggled(this.book, this.tag);

  final Book book;

  final Tag tag;
}

final class BooksFiltered extends BooksEvent {
  BooksFiltered(this.query);

  final String query;
}

final class BookSaved {}
