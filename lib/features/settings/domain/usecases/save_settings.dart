import 'dart:io';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/mappers/local_settings_mapper.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/local_settings_repository.dart';

final class SaveSettings implements UseCase<Unit, SaveSettingsParams> {
  const SaveSettings({required this.settingsRepo});

  final LocalSettingsRepository settingsRepo;

  @override
  Future<Result<Unit, Failure>> call(SaveSettingsParams params) async {
    final settings = toLocalSettings(
      params.isSystemTheme,
      params.isDarkTheme,
      params.backupsDirectory,
    );
    return await settingsRepo.save(settings);
  }
}

final class SaveSettingsParams {
  const SaveSettingsParams({
    required this.isSystemTheme,
    required this.isDarkTheme,
    required this.backupsDirectory,
  });

  final bool isSystemTheme;

  final bool isDarkTheme;

  final Directory backupsDirectory;
}
