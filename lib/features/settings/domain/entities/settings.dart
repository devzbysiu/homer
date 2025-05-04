import 'dart:io';

import 'package:equatable/equatable.dart';

import 'book_size_limits.dart';
import 'reading_goal.dart';

final class Settings extends Equatable {
  const Settings({
    required this.useSystemTheme,
    required this.useDarkTheme,
    required this.backupsDir,
    required this.bookSizeLimits,
    required this.readingGoal,
  });

  factory Settings.makeDefault() {
    return Settings(
      useSystemTheme: true,
      useDarkTheme: true,
      backupsDir: Directory('/storage/emulated/0/Documents'),
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

  Settings changeBackupDir(Directory newDir) {
    return _copyWith(backupsDirectory: newDir);
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

  final Directory backupsDir;

  final ReadingGoal readingGoal;

  Settings _copyWith({
    bool? isDarkThemeOn,
    bool? isSystemThemeOn,
    Directory? backupsDirectory,
    BookSizeLimits? bookSizeLimits,
    ReadingGoal? readingGoal,
  }) {
    return Settings(
      useDarkTheme: isDarkThemeOn ?? useDarkTheme,
      useSystemTheme: isSystemThemeOn ?? useSystemTheme,
      backupsDir: backupsDirectory ?? backupsDir,
      bookSizeLimits: bookSizeLimits ?? this.bookSizeLimits,
      readingGoal: readingGoal ?? this.readingGoal,
    );
  }

  @override
  List<Object> get props => [
    useSystemTheme,
    useDarkTheme,
    bookSizeLimits,
    backupsDir.path,
    readingGoal,
  ];
}
