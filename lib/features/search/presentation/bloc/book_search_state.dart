part of 'book_search_bloc.dart';

@immutable
abstract class BookSearchState extends Equatable {
  const BookSearchState({
    required this.foundBooks,
    this.pickedBook = const None(),
    required this.searchInProgress,
  });

  final List<RemoteBook> foundBooks;

  final Option<RemoteBook> pickedBook;

  final bool searchInProgress;

  @override
  List<Object?> get props => [foundBooks, pickedBook, searchInProgress];
}

final class Empty extends BookSearchState {
  Empty() : super(foundBooks: [], searchInProgress: false);
}

final class SearchInProgress extends BookSearchState {
  SearchInProgress({required super.pickedBook})
      : super(
          foundBooks: [],
          searchInProgress: true,
        );
}

final class FoundBooks extends BookSearchState {
  const FoundBooks({
    required super.pickedBook,
    required super.foundBooks,
  }) : super(searchInProgress: false);
}

final class ClearFoundBooks extends BookSearchState {
  ClearFoundBooks({required super.pickedBook})
      : super(
          foundBooks: List.empty(),
          searchInProgress: false,
        );
}

final class FailedToSearchBooks extends BookSearchState {
  FailedToSearchBooks() : super(foundBooks: [], searchInProgress: false);
}

final class BookPicked extends BookSearchState {
  const BookPicked({super.pickedBook})
      : super(
          foundBooks: const [],
          searchInProgress: false,
        );
}

final class NoPickedBook extends BookSearchState {
  NoPickedBook()
      : super(
          foundBooks: [],
          searchInProgress: false,
        );
}

final class BookShared extends BookSearchState {
  const BookShared({super.pickedBook})
      : super(
          foundBooks: const [],
          searchInProgress: false,
        );
}

final class FetchingSharedBookDetails extends BookSearchState {
  FetchingSharedBookDetails() : super(foundBooks: [], searchInProgress: false);
}

final class FailedToLookUpSharedBook extends BookSearchState {
  FailedToLookUpSharedBook() : super(foundBooks: [], searchInProgress: false);
}
