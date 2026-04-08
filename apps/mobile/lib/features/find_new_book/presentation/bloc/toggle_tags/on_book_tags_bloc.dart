import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/tag.dart';
import 'on_book_tags_event.dart';
import 'on_book_tags_state.dart';

final class OnBookTagsBloc extends Bloc<BookTagsEvent, BookTagsState> {
  OnBookTagsBloc() : super(const BookTagsState.initial()) {
    on<TagSelected>(_onTagSelected);
    on<TagDeselected>(_onTagDeselected);
    on<ClearSelectedTags>(_onClearTags);
  }

  Future<void> _onTagSelected(
    TagSelected event,
    Emitter<BookTagsState> emit,
  ) async {
    final List<Tag> currentSelectedTags = state.selectedTags;
    final selectedTags = List.of(currentSelectedTags)..add(event.tag);
    emit(BookTagsState.tagsSelected(selectedTags));
  }

  Future<void> _onTagDeselected(
    TagDeselected event,
    Emitter<BookTagsState> emit,
  ) async {
    final List<Tag> currentSelectedTags = state.selectedTags;
    final selectedTags = List.of(currentSelectedTags)..remove(event.tag);
    emit(BookTagsState.tagsSelected(selectedTags));
  }

  Future<void> _onClearTags(
    ClearSelectedTags event,
    Emitter<BookTagsState> emit,
  ) async {
    emit(const BookTagsState.empty());
  }
}

extension OnBookTagsContextExt on BuildContext {
  List<Tag> selectedTags() {
    return read<OnBookTagsBloc>().state.selectedTags;
  }

  void selectTag(Tag tag) {
    _emitBookTagsEvt(TagSelected(tag));
  }

  void deselectTag(Tag tag) {
    _emitBookTagsEvt(TagDeselected(tag));
  }

  void _emitBookTagsEvt(BookTagsEvent event) {
    read<OnBookTagsBloc>().add(event);
  }
}
