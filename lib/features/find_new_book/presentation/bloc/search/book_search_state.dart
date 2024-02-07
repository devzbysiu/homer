part of 'book_search_bloc.dart';

@immutable
final class BookSearchState extends Equatable {
  const BookSearchState({
    required this.foundBooks,
    required this.pickedBook,
    required this.value,
    required this.searchFailureCause,
  });

  const BookSearchState.initial()
      : this(
          foundBooks: const [],
          pickedBook: const None(),
          value: Value.initial,
          searchFailureCause: const None(),
        );

  BookSearchState searching() => _copyWith(
        value: Value.searching,
        foundBooks: const [],
      );

  BookSearchState searchFinished(List<Book> foundBooks) => _copyWith(
        value: Value.searchFinished,
        foundBooks: foundBooks,
      );

  BookSearchState shareOffloadFinished(List<Book> foundBooks) => _copyWith(
        value: Value.shareOffloadFinished,
        foundBooks: foundBooks,
      );

  BookSearchState resetShareOffload() => _copyWith(
        value: Value.initial,
      );

  BookSearchState searchFailed(String cause) => _copyWith(
        value: Value.searchFailed,
        foundBooks: const [],
        searchFailureCause: some(cause),
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

  bool get isShareOffloaded => value == Value.shareOffloadFinished;

  BookSearchState _copyWith({
    List<Book>? foundBooks,
    Option<Book>? pickedBook,
    Value? value,
    Option<String>? searchFailureCause,
  }) {
    return BookSearchState(
      foundBooks: foundBooks ?? this.foundBooks,
      pickedBook: pickedBook ?? this.pickedBook,
      value: value ?? this.value,
      searchFailureCause: searchFailureCause ?? this.searchFailureCause,
    );
  }

  @override
  List<Object> get props => [foundBooks, pickedBook, value];
}

enum Value {
  initial,
  searching,
  searchFinished,
  shareOffloadFinished,
  bookPicked,
  bookNotPicked,
  searchFailed,
}
