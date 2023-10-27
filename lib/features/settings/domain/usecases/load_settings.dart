import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/local_settings.dart';
import '../repositories/local_settings_repository.dart';

final class LoadSettings implements UseCase<LocalSettings, NoParams> {
  const LoadSettings({required this.settingsRepo});

  final LocalSettingsRepository settingsRepo;

  @override
  Future<Result<LocalSettings, Failure>> call(NoParams params) async {
    final settings = await settingsRepo.load();
    return Future.value(settings.when(
      (settings) => Success(settings),
      (error) => Error(error),
    ));
  }
}
