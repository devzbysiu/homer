part of 'book_search_bloc.dart';

@immutable
class BookSearchState extends Equatable {
  const BookSearchState({
    this.foundBooks = const [],
    this.pickedBook = const None(),
    this.isSearchInProgress = false,
  });

  final List<RemoteBook> foundBooks;

  final Option<RemoteBook> pickedBook;

  final bool isSearchInProgress;

  factory BookSearchState.initial() => const BookSearchState();

  BookSearchState copyWith({
    List<RemoteBook>? foundBooks,
    Option<RemoteBook>? pickedBook,
    bool? isSearchInProgress,
  }) {
    return BookSearchState(
      foundBooks: foundBooks ?? this.foundBooks,
      pickedBook: pickedBook ?? this.pickedBook,
      isSearchInProgress: isSearchInProgress ?? this.isSearchInProgress,
    );
  }

  @override
  List<Object?> get props => [foundBooks, pickedBook, isSearchInProgress];
}

final class Initial extends BookSearchState {}

final class FailedToSearchBooks extends BookSearchState {}

final class BookPicked extends BookSearchState {
  const BookPicked({super.pickedBook});
}

final class NoPickedBook extends BookSearchState {}

final class BookShared extends BookSearchState {
  const BookShared({super.pickedBook});
}

final class FetchingSharedBookDetails extends BookSearchState {}

final class FailedToLookUpSharedBook extends BookSearchState {
  const FailedToLookUpSharedBook({required this.cause});

  final String cause;
}
