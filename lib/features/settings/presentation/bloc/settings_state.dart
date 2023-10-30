part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState({
    required this.isThemeDark,
    required this.isSystemThemeEnabled,
    required this.backupsDirectory,
  });

  final bool isThemeDark;

  final bool isSystemThemeEnabled;

  final Directory backupsDirectory;

  @override
  List<Object> get props => [
        isThemeDark,
        isSystemThemeEnabled,
        backupsDirectory,
      ];
}

final class SettingsInitial extends SettingsState {
  SettingsInitial()
      : super(
          isThemeDark: true,
          isSystemThemeEnabled: true,
          backupsDirectory: Directory('/storage/emulated/0/Documents'),
        );
}

final class Settings extends SettingsState {
  const Settings({
    required super.isSystemThemeEnabled,
    required super.isThemeDark,
    required super.backupsDirectory,
  });
}

final class FailedToLoadSettings extends SettingsInitial {}
