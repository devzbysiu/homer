part of 'book_tags_bloc.dart';

final class BookTagsState {
  const BookTagsState({this.selectedTags = const {}});

  final Set<TagEntity> selectedTags;
}