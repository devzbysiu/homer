import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../manage_books/domain/entities/local_book.dart';

abstract class RemoteBooksRepository {
  Future<Result<List<LocalBook>, Failure>> search(String query);

  Future<Result<LocalBook, Failure>> fromUrl(String url);
}
