import 'dart:io';

import '../../features/settings/data/models/local_settings_dto.dart';
import '../../features/settings/domain/entities/book_size_limits.dart';
import '../../features/settings/domain/entities/local_settings.dart';

LocalSettings toLocalSettings({
  required bool isDarkThemeOn,
  required bool isSystemThemeOn,
  required Directory backupsDirectory,
  required BookSizeLimits bookSizeLimits,
}) {
  return LocalSettings(
    isDarkThemeOn: isDarkThemeOn,
    isSystemThemeOn: isSystemThemeOn,
    backupsDirectory: backupsDirectory,
    bookSizeLimits: bookSizeLimits,
  );
}

LocalSettingsDTO toSettingsDTO(LocalSettings settings) {
  return LocalSettingsDTO(
    isDarkThemeOn: settings.isDarkThemeOn,
    isSystemThemeOn: settings.isSystemThemeOn,
    backupsDirectory: settings.backupsDirectory,
    bookSizeLimits: settings.bookSizeLimits,
  );
}
