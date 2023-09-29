part of 'search_for_books_bloc.dart';

@immutable
abstract class SearchForBooksState {
  const SearchForBooksState({required this.foundBooks});

  final List<BookEntity> foundBooks;
}

class SearchForBooksInitial extends SearchForBooksState {
  SearchForBooksInitial() : super(foundBooks: List.empty());
}

class FoundBooks extends SearchForBooksState {
  const FoundBooks({required super.foundBooks});
}
