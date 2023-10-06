import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/tag.dart';
import '../../domain/usecases/list_tags.dart';

part 'tags_event.dart';

part 'tags_state.dart';

final class TagsBloc extends Bloc<TagsEvent, TagsState> {
  TagsBloc({required this.listTags}) : super(const Empty()) {
    on<TagsDisplayed>(_onTagsDisplayed);
    add(TagsDisplayed());
  }

  final ListTags listTags;

  Future<void> _onTagsDisplayed(
    TagsDisplayed event,
    Emitter<TagsState> emit,
  ) async {
    final tagsResult = await listTags(NoParams());
    tagsResult.when(
      (success) => emit(TagsLoaded(success)),
      (error) => const FailedToLoadTags(),
    );
    return Future.value();
  }
}
