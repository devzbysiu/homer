import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/tag_entity.dart';
import '../../domain/repositories/tags_repository.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'tags_event.dart';

part 'tags_state.dart';

final class TagsBloc extends Bloc<TagsEvent, TagsState> {
  TagsBloc({required this.tagsRepo}) : super(TagsState(tagsRepo.listAll()));

  final TagsRepository tagsRepo;
}
