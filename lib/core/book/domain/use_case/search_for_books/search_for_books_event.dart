part of 'search_for_books_bloc.dart';

@immutable
abstract class SearchForBooksEvent {}

class SearchInitiated extends SearchForBooksEvent {
  SearchInitiated(this.query);

  final String query;
}
