import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../tags_manager/domain/entities/tag.dart';

part 'book_tags_event.dart';

part 'book_tags_state.dart';

final class BookTagsBloc extends Bloc<BookTagsEvent, BookTagsState> {
  BookTagsBloc() : super(const Empty()) {
    on<TagSelected>(_onTagSelected);
    on<TagDeselected>(_onTagDeselected);
    on<ClearSelectedTags>(_onClearTags);
  }

  Future<void> _onTagSelected(
    TagSelected event,
    Emitter<BookTagsState> emit,
  ) async {
    final selectedTags = Set.of(state.selectedTags)..add(event.tag);
    emit(TagsSelected(selectedTags: selectedTags));
    return Future.value();
  }

  Future<void> _onTagDeselected(
    TagDeselected event,
    Emitter<BookTagsState> emit,
  ) async {
    final selectedTags = Set.of(state.selectedTags)..remove(event.tag);
    emit(TagsSelected(selectedTags: selectedTags));
    return Future.value();
  }

  Future<void> _onClearTags(
    ClearSelectedTags event,
    Emitter<BookTagsState> emit,
  ) async {
    emit(const Empty());
    return Future.value();
  }
}
