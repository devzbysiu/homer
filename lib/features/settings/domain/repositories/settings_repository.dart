import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../entities/settings.dart';

abstract class SettingsRepository {
  Future<Result<Unit, Failure>> save(Settings settings);

  Future<Result<Settings, Failure>> load();
}
