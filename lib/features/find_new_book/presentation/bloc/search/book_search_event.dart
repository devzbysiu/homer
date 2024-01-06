part of 'book_search_bloc.dart';

@immutable
abstract class BookSearchEvent extends Equatable {}

final class SearchInitiated extends BookSearchEvent {
  SearchInitiated(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}
