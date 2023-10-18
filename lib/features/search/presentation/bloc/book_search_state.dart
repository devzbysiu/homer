part of 'book_search_bloc.dart';

@immutable
abstract class SearchForBooksState extends Equatable {
  const SearchForBooksState({
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

final class Empty extends SearchForBooksState {
  Empty() : super(foundBooks: [], searchInProgress: false);
}

final class SearchInProgress extends SearchForBooksState {
  SearchInProgress({required super.pickedBook})
      : super(
          foundBooks: [],
          searchInProgress: true,
        );
}

final class FoundBooks extends SearchForBooksState {
  const FoundBooks({
    required super.pickedBook,
    required super.foundBooks,
  }) : super(searchInProgress: false);
}

final class ClearFoundBooks extends SearchForBooksState {
  ClearFoundBooks({required super.pickedBook})
      : super(
          foundBooks: List.empty(),
          searchInProgress: false,
        );
}

final class FailedToSearchBooks extends SearchForBooksState {
  FailedToSearchBooks() : super(foundBooks: [], searchInProgress: false);
}

final class BookPickedState extends SearchForBooksState {
  const BookPickedState({super.pickedBook})
      : super(
          foundBooks: const [],
          searchInProgress: false,
        );
}

final class NoPickedBook extends SearchForBooksState {
  NoPickedBook()
      : super(
          foundBooks: [],
          searchInProgress: false,
        );
}
