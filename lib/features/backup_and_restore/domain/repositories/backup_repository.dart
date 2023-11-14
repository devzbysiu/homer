import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../manage_books/domain/entities/local_book.dart';

abstract class BackupRepository {
  Future<Result<List<LocalBook>, Failure>> loadAll(String path);

  Future<Result<Unit, Failure>> saveAll(String path, List<LocalBook> books);
}
