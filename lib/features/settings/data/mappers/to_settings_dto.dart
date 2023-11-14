import '../../domain/entities/local_settings.dart';
import '../models/local_settings_dto.dart';

LocalSettingsDTO toSettingsDTO(LocalSettings settings) {
  return LocalSettingsDTO(
    isDarkThemeOn: settings.isDarkThemeOn,
    isSystemThemeOn: settings.isSystemThemeOn,
    backupsDirectory: settings.backupsDirectory,
    bookSizeLimits: settings.bookSizeLimits,
  );
}
