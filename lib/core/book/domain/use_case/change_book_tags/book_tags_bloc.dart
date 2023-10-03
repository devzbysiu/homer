import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../entity/tag_entity.dart';

part 'book_tags_event.dart';

part 'book_tags_state.dart';

final class BookTagsBloc extends Bloc<BookTagsEvent, BookTagsState> {
  BookTagsBloc() : super(const BookTagsState()) {
    on<TagSelected>(_onTagSelected);
    on<TagDeselected>(_onTagDeselected);
    on<ClearSelectedTags>(_onClearTags);
  }

  Future<void> _onTagSelected(
    TagSelected event,
    Emitter<BookTagsState> emit,
  ) async {
    _selectedTags.add(event.tag);
    emit(BookTagsState(selectedTags: Set.of(_selectedTags)));
  }

  Future<void> _onTagDeselected(
    TagDeselected event,
    Emitter<BookTagsState> emit,
  ) async {
    _selectedTags.remove(event.tag);
    emit(BookTagsState(selectedTags: Set.of(_selectedTags)));
  }

  Future<void> _onClearTags(
    ClearSelectedTags event,
    Emitter<BookTagsState> emit,
  ) async {
    _selectedTags.clear();
    emit(BookTagsState(selectedTags: _selectedTags));
  }

  final Set<TagEntity> _selectedTags = {};
}
