import 'package:homer/core/error/failure.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/tag_entity.dart';

abstract class TagsRepository {
  Future<Result<List<TagEntity>, Failure>> listAll();
}