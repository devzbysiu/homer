import 'dart:io';

import '../../domain/entities/book_size_limits.dart';
import '../../domain/entities/settings.dart';

Settings toSettings({
  required bool isDarkThemeOn,
  required bool isSystemThemeOn,
  required Directory backupsDirectory,
  required BookSizeLimits bookSizeLimits,
}) {
  return Settings(
    useDarkTheme: isDarkThemeOn,
    useSystemTheme: isSystemThemeOn,
    backupsDir: backupsDirectory,
    bookSizeLimits: bookSizeLimits,
  );
}
