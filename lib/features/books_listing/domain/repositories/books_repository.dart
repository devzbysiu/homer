import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failure.dart';
import '../entities/book_entity.dart';

abstract class BooksRepository {
  Future<Result<List<BookEntity>, Failure>> listAll();

  Future<Result<Unit, Failure>> add(BookEntity book);

  Future<Result<Unit, Failure>> swap(BookEntity book, BookEntity withCopy);

  Future<Result<List<BookEntity>, Failure>> search(String query);
}
