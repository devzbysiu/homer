part of 'tags_bloc.dart';

@immutable
abstract class TagsState {
  const TagsState({required this.tags});

  final List<TagEntity> tags;
}

final class Empty extends TagsState {
  const Empty() : super(tags: const []);
}

final class TagsLoaded extends TagsState {
  const TagsLoaded(List<TagEntity> tags) : super(tags: tags);
}

final class FailedToLoadTags extends TagsState {
  const FailedToLoadTags() : super(tags: const []);
}