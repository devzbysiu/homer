import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../book_summary/domain/entities/local_book.dart';
import '../entities/restored_book.dart';

abstract class BackupRepository {
  Future<Result<List<RestoredBook>, Failure>> loadAll(String path);

  Future<Result<Unit, Failure>> saveAll(String path, List<LocalBook> books);
}
