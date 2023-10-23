part of 'book_search_bloc.dart';

@immutable
abstract class BookSearchEvent extends Equatable {}

final class SearchInitiated extends BookSearchEvent {
  SearchInitiated(this.query);

  final String query;

  @override
  List<Object?> get props => [query];
}

final class SuggestedBookPicked extends BookSearchEvent {
  SuggestedBookPicked(this.pickedBook);

  final RemoteBook pickedBook;

  @override
  List<Object?> get props => [pickedBook];
}

final class ClearPickedBook extends BookSearchEvent {
  @override
  List<Object?> get props => [];
}
