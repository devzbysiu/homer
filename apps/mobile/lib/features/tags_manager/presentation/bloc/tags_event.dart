import 'package:freezed_annotation/freezed_annotation.dart';

part 'tags_event.freezed.dart';

@freezed
sealed class TagsEvent with _$TagsEvent {
  const factory TagsEvent.tagsDisplayed() = TagsDisplayed;
}
