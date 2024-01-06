part of 'pick_suggestion_bloc.dart';

@immutable
final class PickSuggestionState extends Equatable {
  const PickSuggestionState.initial()
      : pickedBook = const None(),
        value = StateValue.initial,
        failureCause = const None();

  const PickSuggestionState.suggestionNotPicked()
      : pickedBook = const None(),
        value = StateValue.suggestionNotPicked,
        failureCause = const None();

  PickSuggestionState.suggestionPicked(Book book)
      : pickedBook = some(book),
        value = StateValue.suggestionPicked,
        failureCause = const None();

  bool get isSuggestionPicked => value == StateValue.suggestionPicked;

  final Option<Book> pickedBook;

  final StateValue value;

  final Option<String> failureCause;

  @override
  List<Object> get props => [pickedBook, value];
}

enum StateValue {
  initial,
  suggestionPicked,
  suggestionNotPicked,
}
