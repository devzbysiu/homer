import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/tag.dart';
import '../../../../core/error/failures.dart';

abstract class TagsRepository {
  Future<Result<List<Tag>, Failure>> listAll();
}
