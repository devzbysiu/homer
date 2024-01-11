import 'dart:io';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../data/mappers/to_settings.dart';
import '../entities/book_size_limits.dart';
import '../repositories/settings_repository.dart';

typedef SaveSettings = UseCase<Unit, SaveSettingsParams>;

final class SaveSettingsImpl implements SaveSettings {
  const SaveSettingsImpl(this.repo);

  final SettingsRepository repo;

  @override
  Future<Result<Unit, Failure>> call(SaveSettingsParams params) async {
    final settings = toSettings(
      isDarkThemeOn: params.isDarkThemeOn,
      isSystemThemeOn: params.isSystemThemeOn,
      backupsDirectory: params.backupsDirectory,
      bookSizeLimits: params.bookSizeLimits,
    );
    return await repo.save(settings);
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
