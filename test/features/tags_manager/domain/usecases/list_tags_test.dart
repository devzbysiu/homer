import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/tags_manager/domain/usecases/list_tags.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('listTags', () {
    test('should use tags repo to list tags', () async {
      // given
      final tagsRepo = makeMockTagsRepo();
      when(tagsRepo.listAll()).thenAnswer((_) => withSuccess([]));
      final listTags = ListTagsImpl(tagsRepo);

      verifyZeroInteractions(tagsRepo);

      // when
      final _ = await listTags(NoParams());

      // then
      verify(tagsRepo.listAll());
      verifyNoMoreInteractions(tagsRepo);
    });

    test('should return failure when tags repo fails', () async {
      // given
      final tagsRepo = makeMockTagsRepo();
      when(tagsRepo.listAll()).thenAnswer((_) => withError(TestingFailure()));
      final listTags = ListTagsImpl(tagsRepo);

      // when
      final result = await listTags(NoParams());

      // then
      expect(result.isError(), true);
    });

    test('should return success when tags repo works', () async {
      // given
      final tagsRepo = makeMockTagsRepo();
      final tags = [fakeTag(), fakeTag(), fakeTag()];
      when(tagsRepo.listAll()).thenAnswer((_) => withSuccess(tags));
      final listTags = ListTagsImpl(tagsRepo);

      // when
      final result = await listTags(NoParams());

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess(), tags);
    });
  });
}

