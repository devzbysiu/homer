import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/settings.dart';
import '../repositories/settings_repository.dart';

final class LoadSettings implements UseCase<Settings, NoParams> {
  const LoadSettings({required this.settingsRepo});

  final SettingsRepository settingsRepo;

  @override
  Future<Result<Settings, Failure>> call(NoParams params) async {
    final settings = await settingsRepo.load();
    return settings.when(
      (settings) => Success(settings),
      (error) => Error(error),
    );
  }
}
