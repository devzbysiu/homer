import 'package:equatable/equatable.dart';

import 'book_size_limits.dart';
import 'reading_goal.dart';

final class Settings extends Equatable {
  const Settings({
    required this.useSystemTheme,
    required this.useDarkTheme,
    required this.bookSizeLimits,
    required this.readingGoal,
  });

  factory Settings.makeDefault() {
    return Settings(
      useSystemTheme: true,
      useDarkTheme: true,
      bookSizeLimits: BookSizeLimits(shortMax: 300, mediumMax: 500),
      readingGoal: const ReadingGoal(books: 0),
    );
  }

  Settings toggleDarkTheme() {
    return _copyWith(isDarkThemeOn: !useDarkTheme);
  }

  Settings toggleSystemTheme() {
    return _copyWith(isSystemThemeOn: !useSystemTheme);
  }

  Settings changeSizeLimits(BookSizeLimits limits) {
    return _copyWith(bookSizeLimits: limits);
  }

  Settings changeReadingGoal(ReadingGoal goal) {
    return _copyWith(readingGoal: goal);
  }

  final bool useSystemTheme;

  final bool useDarkTheme;

  final BookSizeLimits bookSizeLimits;

  final ReadingGoal readingGoal;

  Settings _copyWith({
    bool? isDarkThemeOn,
    bool? isSystemThemeOn,
    BookSizeLimits? bookSizeLimits,
    ReadingGoal? readingGoal,
  }) {
    return Settings(
      useDarkTheme: isDarkThemeOn ?? useDarkTheme,
      useSystemTheme: isSystemThemeOn ?? useSystemTheme,
      bookSizeLimits: bookSizeLimits ?? this.bookSizeLimits,
      readingGoal: readingGoal ?? this.readingGoal,
    );
  }

  @override
  List<Object> get props => [
    useSystemTheme,
    useDarkTheme,
    bookSizeLimits,
    readingGoal,
  ];
}
