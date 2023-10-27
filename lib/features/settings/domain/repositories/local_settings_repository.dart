import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../entities/local_settings.dart';

abstract class LocalSettingsRepository {
  Future<Result<Unit, Failure>> save(LocalSettings settings);

  Future<Result<LocalSettings, Failure>> load();
}
