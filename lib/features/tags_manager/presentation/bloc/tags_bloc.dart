import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/list_tags.dart';
import 'tags_event.dart';
import 'tags_state.dart';

final class TagsBloc extends Bloc<TagsEvent, TagsState> {
  TagsBloc({required this.listTags}) : super(const TagsState.initial()) {
    on<TagsDisplayed>(_onTagsDisplayed);
    add(TagsDisplayed());
  }

  final ListTags listTags;

  Future<void> _onTagsDisplayed(
    TagsDisplayed event,
    Emitter<TagsState> emit,
  ) async {
    final result = await listTags(NoParams());
    result.when(
      (tags) => emit(TagsState.loaded(tags)),
      (error) => emit(const TagsState.failedToLoad()),
    );
  }
}
