import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failure.dart';
import '../entities/book.dart';

abstract class BooksRepository {
  Future<Result<List<Book>, Failure>> listAll();

  Future<Result<Unit, Failure>> add(Book book);

  Future<Result<Unit, Failure>> swap(Book book, Book withCopy);

  Future<Result<List<Book>, Failure>> search(String query);
}
