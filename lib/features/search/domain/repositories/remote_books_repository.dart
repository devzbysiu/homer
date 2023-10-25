import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../entities/remote_book.dart';

abstract class RemoteBooksRepository {
  Future<Result<List<RemoteBook>, Failure>> search(String query);

  Future<Result<RemoteBook, Failure>> fromUrl(String url);
}
