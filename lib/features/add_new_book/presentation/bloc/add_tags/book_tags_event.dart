part of 'book_tags_bloc.dart';

@immutable
abstract class BookTagsEvent {}

final class TagSelected extends BookTagsEvent {
  TagSelected({required this.tag});

  final TagEntity tag;
}

final class TagDeselected extends BookTagsEvent {
  TagDeselected({required this.tag});

  final TagEntity tag;
}

final class ClearSelectedTags extends BookTagsEvent {}
