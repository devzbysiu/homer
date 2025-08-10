import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/orchestrator/events.dart';
import '../../domain/entities/book_size_limits.dart';
import '../../domain/entities/reading_goal.dart';

part 'settings_event.freezed.dart';

@freezed
sealed class SettingsEvent with _$SettingsEvent implements BusEvent {
  const factory SettingsEvent.settingsLoaded() = SettingsLoaded;

  const factory SettingsEvent.themeToggled() = ThemeToggled;

  const factory SettingsEvent.systemThemeToggled() = SystemThemeToggled;

  const factory SettingsEvent.backupsDirPicked(Directory directory) =
      BackupsDirPicked;

  const factory SettingsEvent.sizeLimitsChanged(BookSizeLimits limits) =
      SizeLimitsChanged;

  const factory SettingsEvent.readingGoalChanged(ReadingGoal goal) =
      ReadingGoalChanged;
}
