import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/tag.dart';
import '../../domain/repositories/tags_repository.dart';

final class InMemoryTagsRepo implements TagsRepository {
  final _allTags = [
    const Tag(name: 'technical', color: TagColor.brown),
    const Tag(name: 'horror', color: TagColor.red),
    const Tag(name: 'non-fiction', color: TagColor.green),
    const Tag(name: 'fiction', color: TagColor.black),
    const Tag(name: 'geopolitics', color: TagColor.orange),
    const Tag(name: 'mystery', color: TagColor.purple),
    const Tag(name: 'apocalyptic', color: TagColor.blue),
    const Tag(name: 'survival', color: TagColor.yellow),
    const Tag(name: 'biography', color: TagColor.grey),
  ];

  @override
  Future<Result<List<Tag>, Failure>> listAll() {
    return Future.value(Success(List.of(_allTags)));
  }
}
