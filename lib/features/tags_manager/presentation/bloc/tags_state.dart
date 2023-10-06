part of 'tags_bloc.dart';

@immutable
abstract class TagsState extends Equatable {
  const TagsState({required this.tags});

  final List<Tag> tags;

  @override
  List<Object> get props => [tags];
}

final class Empty extends TagsState {
  const Empty() : super(tags: const []);
}

final class TagsLoaded extends TagsState {
  const TagsLoaded(List<Tag> tags) : super(tags: tags);
}

final class FailedToLoadTags extends TagsState {
  const FailedToLoadTags() : super(tags: const []);
}
