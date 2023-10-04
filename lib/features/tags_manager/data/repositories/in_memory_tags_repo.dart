import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/tag.dart';
import '../../domain/repositories/tags_repository.dart';

final class InMemoryTagsRepo implements TagsRepository {
  final _allTags = [
    const Tag(name: 'technical', color: TagColor.brown),
    const Tag(name: 'horror', color: TagColor.red),
    const Tag(name: 'non-fiction', color: TagColor.green),
    const Tag(name: 'geopolitics', color: TagColor.orange),
    const Tag(name: 'mystery', color: TagColor.black),
    const Tag(name: 'apocalyptic', color: TagColor.blue),
    const Tag(name: 'btechnical', color: TagColor.brown),
    const Tag(name: 'bhorror', color: TagColor.red),
    const Tag(name: 'bnon-fiction', color: TagColor.green),
    const Tag(name: 'bgeopolitics', color: TagColor.orange),
    const Tag(name: 'bmystery', color: TagColor.black),
    const Tag(name: 'bapocalyptic', color: TagColor.blue),
  ];

  @override
  Future<Result<List<Tag>, Failure>> listAll() {
    return Future.value(Success(List.of(_allTags)));
  }
}
