part of 'pick_suggestion_bloc.dart';

@immutable
final class PickSuggestionState extends Equatable {
  const PickSuggestionState.initial()
      : pickedBook = const None(),
        value = StateValue.initial,
        _cause = const None();

  const PickSuggestionState.suggestionNotPicked()
      : pickedBook = const None(),
        value = StateValue.suggestionNotPicked,
        _cause = const None();

  PickSuggestionState.suggestionPicked(Book book)
      : pickedBook = some(book),
        value = StateValue.suggestionPicked,
        _cause = const None();

  bool get isSuggestionPicked => value == StateValue.suggestionPicked;

  Option<String> get failureCause => _cause;

  final Option<Book> pickedBook;

  final StateValue value;

  final Option<String> _cause;

  @override
  List<Object?> get props => [pickedBook, value];
}

enum StateValue {
  initial,
  suggestionPicked,
  suggestionNotPicked,
}
