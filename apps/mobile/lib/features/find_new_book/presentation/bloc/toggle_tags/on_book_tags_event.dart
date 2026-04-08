import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/tag.dart';

part 'on_book_tags_event.freezed.dart';

@freezed
class BookTagsEvent with _$BookTagsEvent {
  const factory BookTagsEvent.tagSelected(Tag tag) = TagSelected;
  const factory BookTagsEvent.tagDeselected(Tag tag) = TagDeselected;
  const factory BookTagsEvent.clearSelectedTags() = ClearSelectedTags;
}
