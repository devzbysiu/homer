part of 'settings_bloc.dart';

final class SettingsState extends Equatable {
  const SettingsState({
    required this.isDarkThemeOn,
    required this.isSystemThemeOn,
    required this.backupsDirectory,
    required this.bookSizeLimits,
  });

  factory SettingsState.initial() {
    return SettingsState(
      isDarkThemeOn: true,
      isSystemThemeOn: true,
      backupsDirectory: Directory('/storage/emulated/0/Documents'),
      bookSizeLimits: BookSizeLimits(shortMax: 300, mediumMax: 500),
    );
  }

  final bool isDarkThemeOn;

  final bool isSystemThemeOn;

  final Directory backupsDirectory;

  final BookSizeLimits bookSizeLimits;

  SettingsState copyWith({
    bool? isDarkThemeOn,
    bool? isSystemThemeOn,
    Directory? backupsDirectory,
    BookSizeLimits? bookSizeLimits,
  }) {
    return SettingsState(
      isDarkThemeOn: isDarkThemeOn ?? this.isDarkThemeOn,
      isSystemThemeOn: isSystemThemeOn ?? this.isSystemThemeOn,
      backupsDirectory: backupsDirectory ?? this.backupsDirectory,
      bookSizeLimits: bookSizeLimits ?? this.bookSizeLimits,
    );
  }

  @override
  List<Object> get props => [
        isDarkThemeOn,
        isSystemThemeOn,
        backupsDirectory.path,
        bookSizeLimits,
      ];
}

final class FailedToLoadSettings extends SettingsState {
  FailedToLoadSettings()
      : super(
          isDarkThemeOn: true,
          isSystemThemeOn: true,
          backupsDirectory: Directory('/storage/emulated/0/Documents'),
          bookSizeLimits: BookSizeLimits(shortMax: 300, mediumMax: 500),
        );
}

final class FailedToSaveSettings extends SettingsState {
      FailedToSaveSettings(): super(
          isDarkThemeOn: true,
          isSystemThemeOn: true,
          backupsDirectory: Directory('/storage/emulated/0/Documents'),
          bookSizeLimits: BookSizeLimits(shortMax: 300, mediumMax: 500),
        );
}