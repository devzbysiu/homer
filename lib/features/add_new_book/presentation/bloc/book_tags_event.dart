part of 'book_tags_bloc.dart';

@immutable
abstract class BookTagsEvent extends Equatable {}

final class TagSelected extends BookTagsEvent {
  TagSelected({required this.tag});

  final Tag tag;

  @override
  List<Object?> get props => [tag];
}

final class TagDeselected extends BookTagsEvent {
  TagDeselected({required this.tag});

  final Tag tag;

  @override
  List<Object?> get props => [tag];
}

final class ClearSelectedTags extends BookTagsEvent {
  @override
  List<Object?> get props => [];
}
