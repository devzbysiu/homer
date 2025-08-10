import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/entities/tag.dart';

part 'tags_state.freezed.dart';

@freezed
sealed class TagsState with _$TagsState {
  const TagsState._(); // enables helpers

  const factory TagsState.initial({@Default(<Tag>[]) List<Tag> tags}) = Initial;

  const factory TagsState.loaded(List<Tag> tags) = Loaded;

  const factory TagsState.failedToLoad() = FailedToLoad;

  List<Tag> get tagsOrEmpty => maybeWhen(
    initial: (t) => t,
    loaded: (t) => t,
    orElse: () => const <Tag>[],
  );
}
