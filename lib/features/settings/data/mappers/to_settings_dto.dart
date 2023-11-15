import '../../domain/entities/settings.dart';
import '../models/settings_dto.dart';

SettingsDTO toSettingsDTO(Settings settings) {
  return SettingsDTO(
    isDarkThemeOn: settings.isDarkThemeOn,
    isSystemThemeOn: settings.isSystemThemeOn,
    backupsDirectory: settings.backupsDirectory,
    bookSizeLimits: settings.bookSizeLimits,
  );
}
