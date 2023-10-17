part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  const SettingsEvent();
}

final class ThemeToggled extends SettingsEvent {
  @override
  List<Object> get props => [];
}
