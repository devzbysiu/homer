import 'dart:io';

final class LocalSettings {
  LocalSettings({
    required this.isSystemThemeOn,
    required this.isDarkThemeOn,
    required this.backupsDirectory,
  });

  factory LocalSettings.makeDefault() {
    return LocalSettings(
      isSystemThemeOn: true,
      isDarkThemeOn: true,
      backupsDirectory: Directory('/storage/emulated/0/Documents'),
    );
  }

  final bool isSystemThemeOn;

  final bool isDarkThemeOn;

  final Directory backupsDirectory;
}
