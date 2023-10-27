import '../../features/settings/data/models/local_settings_dto.dart';
import '../../features/settings/domain/entities/local_settings.dart';

LocalSettings toLocalSettings(bool isSystemTheme, bool isDarkTheme) {
  return LocalSettings(
      isSystemThemeEnabled: isSystemTheme, isThemeDark: isDarkTheme);
}

LocalSettingsDTO toSettingsDTO(LocalSettings settings) {
  return LocalSettingsDTO(
    isSystemTheme: settings.isSystemThemeEnabled,
    isDarkTheme: settings.isThemeDark,
  );
}
