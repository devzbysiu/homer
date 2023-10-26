part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  SettingsState({
    required this.isThemeDark,
    backupPath = '/storage/emulated/0/Documents',
  }) {
    backupDirectory = Directory(backupPath);
  }

  final bool isThemeDark;

  late final Directory backupDirectory;

  @override
  List<Object> get props => [isThemeDark];
}

final class SettingsInitial extends SettingsState {
  SettingsInitial() : super(isThemeDark: true);
}

final class DarkTheme extends SettingsState {
  DarkTheme() : super(isThemeDark: true);
}

final class LightTheme extends SettingsState {
  LightTheme() : super(isThemeDark: false);
}
