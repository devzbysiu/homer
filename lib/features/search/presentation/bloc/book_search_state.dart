part of 'book_search_bloc.dart';

@immutable
abstract class BookSearchState extends Equatable {
  const BookSearchState({
    this.foundBooks = const [],
    this.pickedBook = const None(),
    this.isSearchInProgress = false,
  });

  final List<RemoteBook> foundBooks;

  final Option<RemoteBook> pickedBook;

  final bool isSearchInProgress;

  @override
  List<Object?> get props => [foundBooks, pickedBook, isSearchInProgress];
}

final class Empty extends BookSearchState {}

final class SearchInProgress extends BookSearchState {
  const SearchInProgress({required super.pickedBook})
      : super(isSearchInProgress: true);
}

final class FoundBooks extends BookSearchState {
  const FoundBooks({
    required super.pickedBook,
    required super.foundBooks,
  });
}

final class ClearFoundBooks extends BookSearchState {
  const ClearFoundBooks({required super.pickedBook});
}

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
