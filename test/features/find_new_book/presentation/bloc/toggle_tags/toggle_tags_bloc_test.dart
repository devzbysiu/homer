import 'package:bloc_test/bloc_test.dart';
import 'package:homer/features/find_new_book/presentation/bloc/toggle_tags/on_book_tags_bloc.dart';
import 'package:test/test.dart';

import '../../../../../test_utils/fakes.dart';

void main() {
  group('_onTagSelected', () {
    final tag1 = fakeTag();
    final tag2 = fakeTag();

    blocTest<OnBookTagsBloc, BookTagsState>(
      'should emit tagsSelected with all tags selected so far',
      build: () => OnBookTagsBloc(),
      act: (bloc) => bloc
        ..add(TagSelected(tag1))
        ..add(TagSelected(tag2)),
      expect: () => [
        BookTagsState.tagsSelected([tag1]),
        BookTagsState.tagsSelected([tag1, tag2]),
      ],
    );
  });

  group('_onTagDeselected', () {
    final tag1 = fakeTag();
    final tag2 = fakeTag();

    blocTest<OnBookTagsBloc, BookTagsState>(
      'should emit tagsSelected with removed deselected tag',
      build: () => OnBookTagsBloc(),
      act: (bloc) => bloc
        ..add(TagSelected(tag1))
        ..add(TagSelected(tag2))
        ..add(TagDeselected(tag1)),
      expect: () => [
        BookTagsState.tagsSelected([tag1]),
        BookTagsState.tagsSelected([tag1, tag2]),
        BookTagsState.tagsSelected([tag2]),
      ],
    );
  });

  group('_onClearTags', () {
    final tag = fakeTag();

    blocTest<OnBookTagsBloc, BookTagsState>(
      'should emit empty',
      build: () => OnBookTagsBloc(),
      act: (bloc) => bloc
        ..add(TagSelected(tag))
        ..add(ClearSelectedTags()),
      expect: () => [
        BookTagsState.tagsSelected([tag]),
        const BookTagsState.empty(),
      ],
    );
  });
}
