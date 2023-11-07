import 'dart:io';

import 'package:equatable/equatable.dart';

import 'book_size_limits.dart';

final class LocalSettings extends Equatable {
  const LocalSettings({
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

  final BookSizeLimits bookSizeLimits;

  final Directory backupsDirectory;

  @override
  List<Object> get props => [
        isSystemThemeOn,
        isDarkThemeOn,
        bookSizeLimits,
        backupsDirectory.path,
      ];
}
