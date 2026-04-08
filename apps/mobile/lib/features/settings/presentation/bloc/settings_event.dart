import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/book_size_limits.dart';
import '../../domain/entities/reading_goal.dart';

part 'settings_event.freezed.dart';

@freezed
sealed class SettingsEvent with _$SettingsEvent {
  const factory SettingsEvent.loadSettings() = LoadSettings;

  const factory SettingsEvent.themeToggled() = ThemeToggled;

  const factory SettingsEvent.systemThemeToggled() = SystemThemeToggled;

  const factory SettingsEvent.sizeLimitsChanged({
    required BookSizeLimits limits,
  }) = SizeLimitsChanged;

  const factory SettingsEvent.readingGoalChanged({required ReadingGoal goal}) =
      ReadingGoalChanged;
}
