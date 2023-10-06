import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../../tags_manager/domain/entities/tag.dart';

part 'book_tags_event.dart';

part 'book_tags_state.dart';

final class BookTagsBloc extends Bloc<BookTagsEvent, BookTagsState> {
  BookTagsBloc() : super(const Empty()) {
    on<TagSelected>(_onTagSelected);
    on<TagDeselected>(_onTagDeselected);
    on<ClearSelectedTags>(_onClearTags);
  }

  final Set<Tag> _selectedTags = {};

  Future<void> _onTagSelected(
    TagSelected event,
    Emitter<BookTagsState> emit,
  ) async {
    _selectedTags.add(event.tag);
    emit(TagsSelected(selectedTags: Set.of(_selectedTags)));
    return Future.value();
  }

  Future<void> _onTagDeselected(
    TagDeselected event,
    Emitter<BookTagsState> emit,
  ) async {
    _selectedTags.remove(event.tag);
    emit(TagsSelected(selectedTags: Set.of(_selectedTags)));
    return Future.value();
  }

  Future<void> _onClearTags(
    ClearSelectedTags event,
    Emitter<BookTagsState> emit,
  ) async {
    _selectedTags.clear();
    emit(const Empty());
    return Future.value();
  }
}
