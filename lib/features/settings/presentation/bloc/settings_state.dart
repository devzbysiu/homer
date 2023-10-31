part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState({
    required this.isDarkThemeOn,
    required this.isSystemThemeOn,
    required this.backupsDirectory,
    required this.bookSizeLimits,
  });

  final bool isDarkThemeOn;

  final bool isSystemThemeOn;

  final Directory backupsDirectory;

  final List<double> bookSizeLimits;

  @override
  List<Object> get props => [
        isDarkThemeOn,
        isSystemThemeOn,
        backupsDirectory,
        bookSizeLimits,
      ];
}

final class SettingsInitial extends SettingsState {
  SettingsInitial()
      : super(
          isDarkThemeOn: true,
          isSystemThemeOn: true,
          backupsDirectory: Directory('/storage/emulated/0/Documents'),
          bookSizeLimits: [300, 500],
        );
}

final class Settings extends SettingsState {
  const Settings({
    required super.isDarkThemeOn,
    required super.isSystemThemeOn,
    required super.backupsDirectory,
    required super.bookSizeLimits,
  });
}

final class FailedToLoadSettings extends SettingsInitial {}
