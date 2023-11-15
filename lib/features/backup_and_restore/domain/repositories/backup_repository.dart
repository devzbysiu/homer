import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../manage_books/domain/entities/book.dart';

abstract class BackupRepository {
  Future<Result<List<Book>, Failure>> loadAll(String path);

  Future<Result<Unit, Failure>> saveAll(String path, List<Book> books);
}
