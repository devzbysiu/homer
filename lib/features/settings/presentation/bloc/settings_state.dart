part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  SettingsState({
    this.isThemeDark = true,
    this.isSystemThemeEnabled = false,
    backupPath = '/storage/emulated/0/Documents',
  }) {
    backupDirectory = Directory(backupPath);
  }

  final bool isThemeDark;

  late final Directory backupDirectory;

  final bool isSystemThemeEnabled;

  @override
  List<Object> get props => [
        isThemeDark,
        isSystemThemeEnabled,
        backupDirectory,
      ];
}

final class SettingsInitial extends SettingsState {}

final class Settings extends SettingsState {
  Settings({
    required super.isSystemThemeEnabled,
    required super.isThemeDark,
  });
}

final class FailedToLoadSettings extends SettingsState {}
