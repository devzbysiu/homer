part of 'settings_bloc.dart';

abstract class SettingsEvent extends Equatable implements BusEvent {
  @override
  List<Object> get props => [];
}

final class SettingsLoaded extends SettingsEvent {}

final class ThemeToggled extends SettingsEvent {}

final class SystemThemeToggled extends SettingsEvent {}

final class BackupsDirPicked extends SettingsEvent {
  BackupsDirPicked(this.directory);

  final Directory directory;

  @override
  List<Object> get props => [directory];
}

final class SizeLimitsChanged extends SettingsEvent {
  SizeLimitsChanged(this.limits);

  final BookSizeLimits limits;
}

final class ReadingGoalChanged extends SettingsEvent {
  ReadingGoalChanged(this.goal);

  final ReadingGoal goal;
}
