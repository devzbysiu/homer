part of 'search_for_books_bloc.dart';

@immutable
abstract class SearchForBooksEvent {}

final class SearchInitiated extends SearchForBooksEvent {
  SearchInitiated(this.query);

  final String query;
}
