import 'dart:io';

import 'package:equatable/equatable.dart';

import 'book_size_limits.dart';

final class Settings extends Equatable {
  const Settings({
    required this.isSystemThemeOn,
    required this.isDarkThemeOn,
    required this.backupsDirectory,
    required this.bookSizeLimits,
  });

  factory Settings.makeDefault() {
    return Settings(
      isSystemThemeOn: true,
      isDarkThemeOn: true,
      backupsDirectory: Directory('/storage/emulated/0/Documents'),
      bookSizeLimits: BookSizeLimits(shortMax: 300, mediumMax: 500),
    );
  }

  Settings toggleDarkTheme() {
    return _copyWith(isDarkThemeOn: !isDarkThemeOn);
  }

  Settings toggleSystemTheme() {
    return _copyWith(isSystemThemeOn: !isSystemThemeOn);
  }

  Settings changeBackupDir(Directory newDir) {
    return _copyWith(backupsDirectory: newDir);
  }

  Settings changeSizeLimits(BookSizeLimits limits) {
    return _copyWith(bookSizeLimits: limits);
  }

  final bool isSystemThemeOn;

  final bool isDarkThemeOn;

  final BookSizeLimits bookSizeLimits;

  final Directory backupsDirectory;

  Settings _copyWith({
    bool? isDarkThemeOn,
    bool? isSystemThemeOn,
    Directory? backupsDirectory,
    BookSizeLimits? bookSizeLimits,
  }) {
    return Settings(
      isDarkThemeOn: isDarkThemeOn ?? this.isDarkThemeOn,
      isSystemThemeOn: isSystemThemeOn ?? this.isSystemThemeOn,
      backupsDirectory: backupsDirectory ?? this.backupsDirectory,
      bookSizeLimits: bookSizeLimits ?? this.bookSizeLimits,
    );
  }

  @override
  List<Object> get props => [
        isSystemThemeOn,
        isDarkThemeOn,
        bookSizeLimits,
        backupsDirectory.path,
      ];
}
