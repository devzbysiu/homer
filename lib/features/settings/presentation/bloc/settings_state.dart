part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState({
    required this.isDarkThemeOn,
    required this.isSystemThemeOn,
    required this.backupsDirectory,
  });

  final bool isDarkThemeOn;

  final bool isSystemThemeOn;

  final Directory backupsDirectory;

  @override
  List<Object> get props => [
        isDarkThemeOn,
        isSystemThemeOn,
        backupsDirectory,
      ];
}

final class SettingsInitial extends SettingsState {
  SettingsInitial()
      : super(
          isDarkThemeOn: true,
          isSystemThemeOn: true,
          backupsDirectory: Directory('/storage/emulated/0/Documents'),
        );
}

final class Settings extends SettingsState {
  const Settings({
    required super.isDarkThemeOn,
    required super.isSystemThemeOn,
    required super.backupsDirectory,
  });
}

final class FailedToLoadSettings extends SettingsInitial {}
