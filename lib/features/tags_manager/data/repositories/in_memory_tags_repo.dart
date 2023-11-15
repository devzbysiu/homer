import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/tag.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/tags_repository.dart';

final class InMemoryTagsRepo implements TagsRepository {
  final _allTags = [
    Tag(name: 'technical', hexColor: Colors.brown.hexCode),
    Tag(name: 'horror', hexColor: Colors.red.hexCode),
    Tag(name: 'nonfiction', hexColor: Colors.green.hexCode),
    Tag(name: 'fiction', hexColor: Colors.black.hexCode),
    Tag(name: 'geopolitics', hexColor: Colors.orange.hexCode),
    Tag(name: 'mystery', hexColor: Colors.purple.hexCode),
    Tag(name: 'apocalyptic', hexColor: Colors.blue.hexCode),
    Tag(name: 'survival', hexColor: Colors.yellow.hexCode),
    Tag(name: 'biography', hexColor: Colors.grey.hexCode),
  ];

  @override
  Future<Result<List<Tag>, Failure>> listAll() {
    return Future.value(Success(List.of(_allTags)));
  }
}
