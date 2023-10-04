import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failure.dart';
import '../../domain/entities/tag_entity.dart';
import '../../domain/repositories/tags_repository.dart';

final class InMemoryTagsRepo implements TagsRepository {
  final _allTags = [
    const TagEntity(name: 'technical', color: TagColor.brown),
    const TagEntity(name: 'horror', color: TagColor.red),
    const TagEntity(name: 'non-fiction', color: TagColor.green),
    const TagEntity(name: 'geopolitics', color: TagColor.orange),
    const TagEntity(name: 'mystery', color: TagColor.black),
    const TagEntity(name: 'apocalyptic', color: TagColor.blue),
    const TagEntity(name: 'btechnical', color: TagColor.brown),
    const TagEntity(name: 'bhorror', color: TagColor.red),
    const TagEntity(name: 'bnon-fiction', color: TagColor.green),
    const TagEntity(name: 'bgeopolitics', color: TagColor.orange),
    const TagEntity(name: 'bmystery', color: TagColor.black),
    const TagEntity(name: 'bapocalyptic', color: TagColor.blue),
  ];

  @override
  Future<Result<List<TagEntity>, Failure>> listAll() {
    return Future.value(Success(List.of(_allTags)));
  }
}
