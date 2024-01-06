part of 'book_search_bloc.dart';

@immutable
final class BookSearchState extends Equatable {
  const BookSearchState.initial()
      : foundBooks = const [],
        value = Value.initial;

  const BookSearchState.searching()
      : foundBooks = const [],
        value = Value.searching;

  const BookSearchState.searchFinished({this.foundBooks = const []})
      : value = Value.searchFinished;

  const BookSearchState.searchFailed()
      : foundBooks = const [],
        value = Value.searchFailed;

  bool get isSearching => value == Value.searching;

  final List<Book> foundBooks;

  final Value value;

  @override
  List<Object?> get props => [foundBooks, value];
}

enum Value {
  initial,
  searching,
  searchFinished,
  searchFailed,
}
