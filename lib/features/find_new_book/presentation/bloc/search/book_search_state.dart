import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/book.dart';

part 'book_search_state.freezed.dart';

enum BookSearchMode {
  initial,
  searching,
  searchFinished,
  shareOffloadFinished,
  bookPicked,
  bookNotPicked,
  searchFailed,
}

@freezed
class BookSearchState with _$BookSearchState {
  const factory BookSearchState({
    @Default(<Book>[]) List<Book> foundBooks,
    @Default(None<Book>()) Option<Book> pickedBook,
    @Default(BookSearchMode.initial) BookSearchMode mode,
    @Default(None<String>()) Option<String> searchFailureCause,
  }) = _BookSearchState;

  const BookSearchState._();

  factory BookSearchState.initial() => const BookSearchState();

  BookSearchState searching() => copyWith(
    mode: BookSearchMode.searching,
    foundBooks: const [],
    searchFailureCause: const None(),
  );

  BookSearchState searchFinished(List<Book> books) => copyWith(
    mode: BookSearchMode.searchFinished,
    foundBooks: books,
    searchFailureCause: const None(),
  );

  BookSearchState shareOffloadFinished(List<Book> books) =>
      copyWith(mode: BookSearchMode.shareOffloadFinished, foundBooks: books);

  BookSearchState resetShareOffload() => copyWith(mode: BookSearchMode.initial);

  BookSearchState searchFailed(String cause) => copyWith(
    mode: BookSearchMode.searchFailed,
    foundBooks: const [],
    searchFailureCause: some(cause),
  );

  BookSearchState picked(Book book) => copyWith(
    mode: BookSearchMode.bookPicked,
    pickedBook: some(book),
    foundBooks: const [],
    searchFailureCause: const None(),
  );

  BookSearchState noPickedBook() => copyWith(
    mode: BookSearchMode.bookNotPicked,
    pickedBook: const None(),
    foundBooks: const [],
    searchFailureCause: const None(),
  );

  bool get isSearching => mode == BookSearchMode.searching;
  bool get isSuggestionPicked => mode == BookSearchMode.bookPicked;
  bool get isShareOffloaded => mode == BookSearchMode.shareOffloadFinished;
}
