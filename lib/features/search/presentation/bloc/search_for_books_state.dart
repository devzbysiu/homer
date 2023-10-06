part of 'search_for_books_bloc.dart';

@immutable
abstract class SearchForBooksState extends Equatable {
  const SearchForBooksState({required this.foundBooks});

  final List<Book> foundBooks;

  @override
  List<Object> get props => [foundBooks];
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
