part of 'book_search_bloc.dart';

@immutable
abstract class BookSearchEvent extends Equatable implements BusEvent {
  @override
  List<Object> get props => [];
}

final class SearchStarted extends BookSearchEvent {
  SearchStarted(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}

final class SuggestionPicked extends BookSearchEvent {
  SuggestionPicked(this.pickedBook);

  final Book pickedBook;

  @override
  List<Object> get props => [pickedBook];
}

final class ClearPickedBook extends BookSearchEvent {}

final class ShareOffloaded extends BookSearchEvent {
  ShareOffloaded(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}

final class ResetShareOffload extends BookSearchEvent {}
