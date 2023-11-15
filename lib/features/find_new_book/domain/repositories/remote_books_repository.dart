import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../manage_books/domain/entities/book.dart';

abstract class RemoteBooksRepository {
  Future<Result<List<Book>, Failure>> search(String query);

  Future<Result<Book, Failure>> fromUrl(String url);
}
