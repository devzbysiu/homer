import 'package:flutter_bloc/flutter_bloc.dart';

import '../../entity/tag_entity.dart';
import '../../repository/tags_repository.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'tags_event.dart';

part 'tags_state.dart';

final class TagsBloc extends Bloc<TagsEvent, TagsState> {
  TagsBloc({required this.tagsRepo}) : super(TagsState(tagsRepo.listAll()));

  final TagsRepository tagsRepo;
}
