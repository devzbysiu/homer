import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';

abstract class ExternalBooksRepository {
  Future<Result<List<Book>, Failure>> search(String query);

  Future<Result<Book, Failure>> fromUrl(String url);
}
