part of 'search_for_books_bloc.dart';

@immutable
abstract class SearchForBooksState extends Equatable {
  const SearchForBooksState({
    required this.foundBooks,
    this.pickedBook,
  });

  final List<RemoteBook> foundBooks;

  final RemoteBook? pickedBook;

  @override
  List<Object?> get props => [foundBooks, pickedBook];
}

final class Empty extends SearchForBooksState {
  const Empty() : super(foundBooks: const []);
}

final class FoundBooks extends SearchForBooksState {
  const FoundBooks({required super.foundBooks});
}

final class FailedToSearchBooks extends SearchForBooksState {
  const FailedToSearchBooks() : super(foundBooks: const []);
}

final class BookPickedState extends SearchForBooksState {
  const BookPickedState({super.pickedBook}) : super(foundBooks: const []);
}

final class NoPickedBook extends SearchForBooksState {
  const NoPickedBook() : super(foundBooks: const []);
}
