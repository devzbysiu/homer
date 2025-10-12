import '../../domain/entities/settings.dart';
import '../models/settings_dto.dart';

SettingsDTO toSettingsDTO(Settings settings) {
  return SettingsDTO(
    isDarkThemeOn: settings.useDarkTheme,
    isSystemThemeOn: settings.useSystemTheme,
    bookSizeLimits: settings.bookSizeLimits,
    readingGoal: settings.readingGoal,
  );
}
