part of 'on_book_tags_bloc.dart';

abstract class BookTagsState extends Equatable {
  const BookTagsState({required this.selectedTags});

  final List<Tag> selectedTags;
}

final class Empty extends BookTagsState {
  const Empty() : super(selectedTags: const []);

  @override
  List<Object> get props => [];
}

final class TagsSelected extends BookTagsState {
  const TagsSelected({required super.selectedTags});

  @override
  List<Object> get props => [selectedTags];
}
