import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/core/book/domain/entity/tag_entity.dart';
import 'package:meta/meta.dart';

part 'book_tags_event.dart';

part 'book_tags_state.dart';

final class BookTagsBloc extends Bloc<BookTagsEvent, BookTagsState> {
  BookTagsBloc() : super(const BookTagsState()) {
    on<TagSelected>(_onTagSelected);
    on<TagDeselected>(_onTagDeselected);
    on<ClearSelectedTags>(_onClearTags);
  }

  final Set<TagEntity> _selectedTags = {};

  FutureOr<void> _onTagSelected(
    TagSelected event,
    Emitter<BookTagsState> emit,
  ) {
    _selectedTags.add(event.tag);
    emit(BookTagsState(selectedTags: Set.of(_selectedTags)));
  }

  FutureOr<void> _onTagDeselected(
    TagDeselected event,
    Emitter<BookTagsState> emit,
  ) {
    _selectedTags.remove(event.tag);
    emit(BookTagsState(selectedTags: Set.of(_selectedTags)));
  }

  FutureOr<void> _onClearTags(
    ClearSelectedTags event,
    Emitter<BookTagsState> emit,
  ) {
    _selectedTags.clear();
    emit(BookTagsState(selectedTags: _selectedTags));
  }
}
