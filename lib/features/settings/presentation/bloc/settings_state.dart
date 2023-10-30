part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState({
    this.isThemeDark = true,
    this.isSystemThemeEnabled = false,
    this.backupsPath = '/storage/emulated/0/Documents',
  });

  final bool isThemeDark;

  final String backupsPath;

  Directory get backupsDirectory => Directory(backupsPath);

  final bool isSystemThemeEnabled;

  @override
  List<Object> get props => [
        isThemeDark,
        isSystemThemeEnabled,
        backupsPath,
      ];
}

final class SettingsInitial extends SettingsState {}

final class Settings extends SettingsState {
  Settings({
    required super.isSystemThemeEnabled,
    required super.isThemeDark,
    required super.backupsPath,
  });
}

final class FailedToLoadSettings extends SettingsState {}
