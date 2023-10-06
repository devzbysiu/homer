part of 'search_for_books_bloc.dart';

@immutable
abstract class SearchForBooksEvent extends Equatable {}

final class SearchInitiated extends SearchForBooksEvent {
  SearchInitiated(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}
