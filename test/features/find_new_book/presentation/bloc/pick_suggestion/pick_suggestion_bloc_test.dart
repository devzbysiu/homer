import 'package:bloc_test/bloc_test.dart';
import 'package:homer/features/find_new_book/presentation/bloc/pick_suggestion/pick_suggestion_bloc.dart';
import 'package:test/test.dart';

import '../../../../../test_utils/fakes.dart';

void main() {
  group('_onSuggestionBookPicked', () {
    final book = fakeBook();

    blocTest<PickSuggestionBloc, PickSuggestionState>(
      'should emit searchingFinished',
      build: () => PickSuggestionBloc(),
      act: (bloc) => bloc.add(SuggestedBookPicked(book)),
      expect: () => [PickSuggestionState.suggestionPicked(book)],
    );
  });

  group('_onClearPickedBook', () {
    blocTest<PickSuggestionBloc, PickSuggestionState>(
      'should emit suggestionNotPicked',
      build: () => PickSuggestionBloc(),
      act: (bloc) => bloc.add(ClearPickedBook()),
      expect: () => [const PickSuggestionState.suggestionNotPicked()],
    );
  });
}
