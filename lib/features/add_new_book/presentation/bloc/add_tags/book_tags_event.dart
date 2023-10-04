part of 'book_tags_bloc.dart';

@immutable
abstract class BookTagsEvent {}

final class TagSelected extends BookTagsEvent {
  TagSelected({required this.tag});

  final Tag tag;
}

final class TagDeselected extends BookTagsEvent {
  TagDeselected({required this.tag});

  final Tag tag;
}

final class ClearSelectedTags extends BookTagsEvent {}
