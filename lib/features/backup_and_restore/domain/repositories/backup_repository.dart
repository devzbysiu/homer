import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';

abstract class BackupRepository {
  Future<Result<List<Book>, Failure>> loadAll(String path);

  Future<Result<Unit, Failure>> saveAll(String path, List<Book> books);
}
