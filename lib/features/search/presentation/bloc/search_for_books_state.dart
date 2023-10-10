part of 'search_for_books_bloc.dart';

@immutable
abstract class SearchForBooksState extends Equatable {
  SearchForBooksState({
    required this.foundBooks,
    RemoteBook? pickedBook,
  }) : pickedBook = optionOf(pickedBook);

  final List<RemoteBook> foundBooks;

  final Option<RemoteBook> pickedBook;

  @override
  List<Object?> get props => [foundBooks, pickedBook];
}

final class Empty extends SearchForBooksState {
  Empty() : super(foundBooks: []);
}

final class FoundBooks extends SearchForBooksState {
  FoundBooks({required super.foundBooks});
}

final class FailedToSearchBooks extends SearchForBooksState {
  FailedToSearchBooks() : super(foundBooks: []);
}

final class BookPickedState extends SearchForBooksState {
  BookPickedState({super.pickedBook}) : super(foundBooks: const []);
}

final class NoPickedBook extends SearchForBooksState {
  NoPickedBook() : super(foundBooks: []);
}
