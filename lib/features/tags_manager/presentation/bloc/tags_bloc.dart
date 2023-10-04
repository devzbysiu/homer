import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/core/usecase/usecase.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../domain/entities/tag_entity.dart';
import '../../domain/usecases/list_tags.dart';

part 'tags_event.dart';

part 'tags_state.dart';

final class TagsBloc extends Bloc<TagsEvent, TagsState> {
  TagsBloc({required this.listTags}) : super(const Empty()) {
    on<TagsDisplayed>(_onTagsDisplayed);
    add(TagsDisplayed());
  }

  Future<void> _onTagsDisplayed(
    TagsDisplayed event,
    Emitter<TagsState> emit,
  ) async {
    final tagsResult = await listTags(NoParams());
    tagsResult.when(
      (success) => emit(TagsLoaded(success)),
      (error) => const FailedToLoadTags(),
    );
  }

  final ListTags listTags;
}
