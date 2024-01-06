part of 'pick_suggestion_bloc.dart';

@immutable
abstract class PickSuggestionEvent extends Equatable {}

final class SuggestedBookPicked extends PickSuggestionEvent {
  SuggestedBookPicked(this.pickedBook);

  final Book pickedBook;

  @override
  List<Object?> get props => [pickedBook];
}

final class ClearPickedBook extends PickSuggestionEvent {
  @override
  List<Object?> get props => [];
}