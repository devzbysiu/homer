import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/settings.dart';
import '../repositories/settings_repository.dart';

typedef LoadSettings = UseCase<Settings, NoParams>;

final class LoadSettingsImpl implements LoadSettings {
  const LoadSettingsImpl(this.repo);

  final SettingsRepository repo;

  @override
  Future<Result<Settings, Failure>> call(NoParams params) async {
    return await repo.load();
  }
}
