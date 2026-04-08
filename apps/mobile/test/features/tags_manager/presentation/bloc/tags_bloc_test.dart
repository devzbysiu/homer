import 'package:bloc_test/bloc_test.dart';
import 'package:homer/core/entities/tag.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/tags_manager/presentation/bloc/tags_bloc.dart';
import 'package:homer/features/tags_manager/presentation/bloc/tags_event.dart';
import 'package:homer/features/tags_manager/presentation/bloc/tags_state.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('_onTagsDisplayed', () {
    final tags = [fakeTag(), fakeTag(), fakeTag()];

    blocTest<TagsBloc, TagsState>(
      'should emit loaded on start',
      build: () => BlocMock().onListTags(Success(tags)).get(),
      act: (bloc) => {/* do nothing */},
      expect: () => [TagsState.loaded(tags)],
      verify: (bloc) => verify(bloc.listTags(NoParams())),
    );

    blocTest<TagsBloc, TagsState>(
      'should emit loaded with loaded tags',
      build: () => BlocMock().onListTags(Success(tags)).get(),
      act: (bloc) => bloc.add(TagsDisplayed()),
      expect: () => [TagsState.loaded(tags)],
      verify: (bloc) => verify(bloc.listTags(NoParams())),
    );

    blocTest<TagsBloc, TagsState>(
      'should emit failedToLoad when listTags fails ',
      build: () => BlocMock().onListTags(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(TagsDisplayed()),
      expect: () => [const TagsState.failedToLoad()],
      verify: (bloc) => verify(bloc.listTags(NoParams())),
    );
  });
}

final class BlocMock {
  BlocMock() {
    provideDummy<Result<List<Tag>, Failure>>(const Success([]));

    _listTags = MockListTags();

    when(_listTags.call(any)).thenAnswer((_) => withSuccess([]));
  }

  late final MockListTags _listTags;

  BlocMock onListTags(Result<List<Tag>, Failure> ret) {
    when(_listTags.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  TagsBloc get() => TagsBloc(listTags: _listTags);
}
