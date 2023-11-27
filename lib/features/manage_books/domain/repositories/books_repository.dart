import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';

abstract class BooksRepository {
  Future<Result<List<Book>, Failure>> listAll();

  Future<Result<Unit, Failure>> add(Book book);

  Future<Result<Unit, Failure>> replaceAll(List<Book> books);

  Future<Result<Unit, Failure>> update(Book modified);

  Future<Result<Unit, Failure>> delete(List<Book> books);
}
