part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class SettingsLoaded extends SettingsEvent {}

final class ThemeToggled extends SettingsEvent {}

final class SystemThemeToggled extends SettingsEvent {}
