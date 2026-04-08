import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/tag.dart';

part 'on_book_tags_state.freezed.dart';

@freezed
class BookTagsState with _$BookTagsState {
  const BookTagsState._(); // enables instance methods
  const factory BookTagsState.initial() = Initial;
  const factory BookTagsState.tagsSelected(List<Tag> selectedTags) =
      TagsSelected;
  const factory BookTagsState.empty() = Empty;

  List<Tag> get selectedTags => maybeWhen(
    initial: () => const <Tag>[],
    tagsSelected: (t) => t,
    empty: () => const <Tag>[],
    orElse: () => const <Tag>[],
  );
}
