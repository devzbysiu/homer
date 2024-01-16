import 'dart:io';

import 'package:equatable/equatable.dart';

import 'book_size_limits.dart';

final class Settings extends Equatable {
  const Settings({
    required this.useSystemTheme,
    required this.useDarkTheme,
    required this.backupsDir,
    required this.bookSizeLimits,
  });

  factory Settings.makeDefault() {
    return Settings(
      useSystemTheme: true,
      useDarkTheme: true,
      backupsDir: Directory('/storage/emulated/0/Documents'),
      bookSizeLimits: BookSizeLimits(shortMax: 300, mediumMax: 500),
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

  final bool useSystemTheme;

  final bool useDarkTheme;

  final BookSizeLimits bookSizeLimits;

  final Directory backupsDir;

  Settings _copyWith({
    bool? isDarkThemeOn,
    bool? isSystemThemeOn,
    Directory? backupsDirectory,
    BookSizeLimits? bookSizeLimits,
  }) {
    return Settings(
      useDarkTheme: isDarkThemeOn ?? this.useDarkTheme,
      useSystemTheme: isSystemThemeOn ?? this.useSystemTheme,
      backupsDir: backupsDirectory ?? this.backupsDir,
      bookSizeLimits: bookSizeLimits ?? this.bookSizeLimits,
    );
  }

  @override
  List<Object> get props => [
        useSystemTheme,
        useDarkTheme,
        bookSizeLimits,
        backupsDir.path,
      ];
}
