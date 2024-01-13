part of 'book_search_bloc.dart';

@immutable
final class BookSearchState extends Equatable {
  const BookSearchState._({
    this.foundBooks = const [],
    this.pickedBook = const None(),
    this.value = Value.initial,
    this.searchFailureCause = const None(),
  });

  const BookSearchState.initial() : this._();

  BookSearchState searching() => _copyWith(
        value: Value.searching,
        foundBooks: const [],
      );

  BookSearchState searchFinished(List<Book> foundBooks) => _copyWith(
        value: Value.searchFinished,
        foundBooks: foundBooks,
      );

  BookSearchState searchFailed() => _copyWith(
        value: Value.searchFailed,
        foundBooks: const [],
      );

  const BookSearchState.picked(this.pickedBook)
      : foundBooks = const [],
        searchFailureCause = const None(),
        value = Value.bookPicked;

  const BookSearchState.noPickedBook()
      : foundBooks = const [],
        searchFailureCause = const None(),
        pickedBook = const None(),
        value = Value.bookNotPicked;

  bool get isSearching => value == Value.searching;

  final List<Book> foundBooks;

  final Option<Book> pickedBook;

  final Value value;

  final Option<String> searchFailureCause;

  bool get isSuggestionPicked => value == Value.bookPicked;

  BookSearchState _copyWith({
    List<Book>? foundBooks,
    Option<Book>? pickedBook,
    Value? value,
  }) {
    return BookSearchState._(
      foundBooks: foundBooks ?? this.foundBooks,
      pickedBook: pickedBook ?? this.pickedBook,
      value: value ?? this.value,
    );
  }

  @override
  List<Object> get props => [foundBooks, pickedBook, value];
}

enum Value {
  initial,
  searching,
  searchFinished,
  bookPicked,
  bookNotPicked,
  searchFailed,
}
