import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../entities/external_book_info.dart';

abstract class ExternalBookInfoRepository {
  Future<Result<ExternalBookInfo, Failure>> fromUrl(String url);
}
