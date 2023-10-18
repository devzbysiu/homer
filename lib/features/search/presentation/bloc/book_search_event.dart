part of 'book_search_bloc.dart';

@immutable
abstract class SearchForBooksEvent extends Equatable {}

final class SearchInitiated extends SearchForBooksEvent {
  SearchInitiated(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

final class SuggestedBookPicked extends SearchForBooksEvent {
  SuggestedBookPicked(this.pickedBook);

  final RemoteBook pickedBook;

  @override
  List<Object?> get props => [pickedBook];
}

final class ClearPickedBook extends SearchForBooksEvent {
  @override
  List<Object?> get props => [];
}

final class CloseSuggestions {}
