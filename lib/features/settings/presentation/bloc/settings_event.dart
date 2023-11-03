part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class SettingsLoaded extends SettingsEvent {}

final class ThemeToggled extends SettingsEvent {}

final class SystemThemeToggled extends SettingsEvent {}

final class BackupsDirectorySelected extends SettingsEvent {
  BackupsDirectorySelected(this.directory);

  final Directory directory;

  @override
  List<Object> get props => [directory];
}

final class BookSizeLimitsChanged extends SettingsEvent {
  BookSizeLimitsChanged(this.limits);

  final BookSizeLimits limits;
}
