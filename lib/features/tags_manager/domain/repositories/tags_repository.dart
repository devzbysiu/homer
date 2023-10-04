import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failure.dart';
import '../entities/tag.dart';

abstract class TagsRepository {
  Future<Result<List<Tag>, Failure>> listAll();
}
