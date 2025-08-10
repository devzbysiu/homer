import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/book.dart';
import '../../../../../core/orchestrator/events.dart';

part 'book_search_event.freezed.dart';

@freezed
sealed class SearchEvent with _$SearchEvent implements BusEvent {
  const factory SearchEvent.searching({required String query}) = Searching;
  const factory SearchEvent.suggestionPicked({required Book pickedBook}) =
      SuggestionPicked;
  const factory SearchEvent.clearPickedBook() = ClearPickedBook;
  const factory SearchEvent.shareOffloaded({required String query}) =
      ShareOffloaded;
  const factory SearchEvent.resetShareOffloaded() = ResetShareOffload;
}
