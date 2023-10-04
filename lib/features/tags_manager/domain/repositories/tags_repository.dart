import 'package:homer/core/error/failure.dart';
import 'package:multiple_result/multiple_result.dart';

import '../entities/tag.dart';

abstract class TagsRepository {
  Future<Result<List<Tag>, Failure>> listAll();
}