import '../../domain/entities/settings.dart';
import '../models/settings_dto.dart';

SettingsDTO toSettingsDTO(Settings settings) {
  return SettingsDTO(
    isDarkThemeOn: settings.useDarkTheme,
    isSystemThemeOn: settings.useSystemTheme,
    backupsDirectory: settings.backupsDir,
    bookSizeLimits: settings.bookSizeLimits,
  );
}
