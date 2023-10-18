import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/add_new_book/presentation/bloc/on_book_tags_bloc.dart';
import '../../../features/tags_manager/domain/entities/tag.dart';

extension OnBookTagsContextExt on BuildContext {
  Set<Tag> selectedTags() {
    return read<OnBookTagsBloc>().state.selectedTags;
  }

  void clearSelectedTags() {
    _emitBookTagsEvt(ClearSelectedTags());
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
