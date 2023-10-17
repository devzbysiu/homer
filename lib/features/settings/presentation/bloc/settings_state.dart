part of 'settings_bloc.dart';

abstract class SettingsState extends Equatable {
  const SettingsState({required this.isThemeDark});

  final bool isThemeDark;

  @override
  List<Object> get props => [isThemeDark];
}

final class SettingsInitial extends SettingsState {
  const SettingsInitial() : super(isThemeDark: true);
}

final class DarkTheme extends SettingsState {
  const DarkTheme() : super(isThemeDark: true);
}

final class LightTheme extends SettingsState {
  const LightTheme() : super(isThemeDark: false);
}
