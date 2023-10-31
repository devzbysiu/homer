import 'dart:io';

final class LocalSettings {
  LocalSettings({
    required this.isSystemThemeOn,
    required this.isDarkThemeOn,
    required this.backupsDirectory,
    required this.bookSizeLimits,
  });

  factory LocalSettings.makeDefault() {
    return LocalSettings(
      isSystemThemeOn: true,
      isDarkThemeOn: true,
      backupsDirectory: Directory('/storage/emulated/0/Documents'),
      bookSizeLimits: [300, 500],
    );
  }

  final bool isSystemThemeOn;

  final bool isDarkThemeOn;

  final Directory backupsDirectory;

  final List<double> bookSizeLimits;
}
