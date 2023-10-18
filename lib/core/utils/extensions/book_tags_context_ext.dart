import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/tags_manager/domain/entities/tag.dart';
import '../../../features/tags_manager/presentation/bloc/tags_bloc.dart';

extension TagsContextExt on BuildContext {
  List<Tag> allTags() {
    return select((TagsBloc bloc) => bloc.state.tags);
  }
}
