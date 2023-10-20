import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../book/domain/entities/local_book.dart';

abstract class LocalBooksRepository {
  Future<Result<List<LocalBook>, Failure>> listAll();

  Future<Result<Unit, Failure>> add(LocalBook book);

  Future<Result<Unit, Failure>> addAll(List<LocalBook> books);

  Future<Result<Unit, Failure>> update(LocalBook modified);

  Future<Result<Unit, Failure>> delete(List<LocalBook> books);

  Future<Result<Unit, Failure>> deleteAll();
}
