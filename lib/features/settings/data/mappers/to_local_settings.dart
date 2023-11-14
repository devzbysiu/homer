import 'dart:io';

import '../../domain/entities/book_size_limits.dart';
import '../../domain/entities/local_settings.dart';

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
