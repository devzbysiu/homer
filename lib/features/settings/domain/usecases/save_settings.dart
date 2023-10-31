import 'dart:io';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/mappers/local_settings_mapper.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/book_size_limits.dart';
import '../repositories/local_settings_repository.dart';

final class SaveSettings implements UseCase<Unit, SaveSettingsParams> {
  const SaveSettings({required this.settingsRepo});

  final LocalSettingsRepository settingsRepo;

  @override
  Future<Result<Unit, Failure>> call(SaveSettingsParams params) async {
    final settings = toLocalSettings(
      params.isSystemThemeOn,
      params.isDarkThemeOn,
      params.backupsDirectory,
      params.bookSizeLimits,
    );
    return await settingsRepo.save(settings);
  }
}

final class SaveSettingsParams {
  const SaveSettingsParams({
    required this.isSystemThemeOn,
    required this.isDarkThemeOn,
    required this.backupsDirectory,
    required this.bookSizeLimits,
  });

  final bool isSystemThemeOn;

  final bool isDarkThemeOn;

  final Directory backupsDirectory;

  final BookSizeLimits bookSizeLimits;
}
