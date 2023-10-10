import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../entities/restored_book.dart';

abstract class BackupRepository {
  Future<Result<List<RestoredBook>, Failure>> loadAll(String path);
}
