import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../entities/book.dart';

abstract class BooksRepository {
  Future<Result<List<Book>, Failure>> listAll();

  Future<Result<Unit, Failure>> add(Book book);

  Future<Result<Unit, Failure>> update(Book modified);

  Future<Result<Unit, Failure>> delete(List<Book> books);

  Future<Result<List<Book>, Failure>> search(String query);
}
