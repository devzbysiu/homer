import 'package:homer/core/book/domain/entity/tag_entity.dart';
import 'package:homer/core/book/domain/repository/tags_repository.dart';

final class InMemoryTagsRepo extends TagsRepository {
  final _allTags = [
    const TagEntity(name: 'type:technical', color: TagColor.brown),
    const TagEntity(name: 'type:horror', color: TagColor.red),
    const TagEntity(name: 'type:non-fiction', color: TagColor.green),
    const TagEntity(name: 'type:geopolitics', color: TagColor.orange),
  ];

  @override
  List<TagEntity> listAll() => List.of(_allTags);
}