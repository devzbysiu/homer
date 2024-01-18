part of 'tags_bloc.dart';

final class TagsState extends Equatable {
  const TagsState({required this.tags});

  const TagsState.initial() : tags = const [];

  const TagsState.loaded(this.tags);

  const TagsState.failedToLoad() : tags = const [];

  final List<Tag> tags;

  @override
  List<Object> get props => [tags];
}
