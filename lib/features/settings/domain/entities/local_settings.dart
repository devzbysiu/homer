import 'dart:io';

final class LocalSettings {
  LocalSettings({
    required this.isSystemThemeEnabled,
    required this.isThemeDark,
    required this.backupsDirectory,
  });

  factory LocalSettings.makeDefault() {
    return LocalSettings(
      isSystemThemeEnabled: true,
      isThemeDark: true,
      backupsDirectory: Directory('/storage/emulated/0/Documents'),
    );
  }

  final bool isSystemThemeEnabled;

  final bool isThemeDark;

  final Directory backupsDirectory;
}
