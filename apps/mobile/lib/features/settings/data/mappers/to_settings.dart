import '../../domain/entities/book_size_limits.dart';
import '../../domain/entities/reading_goal.dart';
import '../../domain/entities/settings.dart';

Settings toSettings({
  required bool isDarkThemeOn,
  required bool isSystemThemeOn,
  required BookSizeLimits bookSizeLimits,
  required ReadingGoal readingGoal,
}) {
  return Settings(
    useDarkTheme: isDarkThemeOn,
    useSystemTheme: isSystemThemeOn,
    bookSizeLimits: bookSizeLimits,
    readingGoal: readingGoal,
  );
}
