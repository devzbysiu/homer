part of 'on_book_tags_bloc.dart';

@immutable
final class BookTagsState extends Equatable {
  const BookTagsState.initial() : selectedTags = const [];

  const BookTagsState.tagsSelected(this.selectedTags);

  const BookTagsState.empty() : selectedTags = const [];

  final List<Tag> selectedTags;

  @override
  List<Object> get props => [selectedTags];
}
