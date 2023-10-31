import 'dart:io';

import 'book_size_limits.dart';

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
      bookSizeLimits: BookSizeLimits(shortMax: 300, mediumMax: 500),
    );
  }

  final bool isSystemThemeOn;

  final bool isDarkThemeOn;

  final Directory backupsDirectory;

  final BookSizeLimits bookSizeLimits;
}
