import 'dart:io';

import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/book_size_limits.dart';
import '../../domain/entities/reading_goal.dart';
import '../../domain/entities/settings.dart';

part 'settings_state.freezed.dart';

@freezed
class SettingsState with _$SettingsState {
  const SettingsState._(); // enables instance methods/getters

  const factory SettingsState({required Settings settings}) = _SettingsState;

  factory SettingsState.initial() =>
      SettingsState(settings: Settings.makeDefault());

  factory SettingsState.from(Settings settings) =>
      SettingsState(settings: settings);

  factory SettingsState.failedToLoad() =>
      SettingsState(settings: Settings.makeDefault());

  factory SettingsState.failedToSave() =>
      SettingsState(settings: Settings.makeDefault());

  SettingsState toggleDarkTheme() =>
      copyWith(settings: settings.toggleDarkTheme());

  SettingsState toggleSystemTheme() =>
      copyWith(settings: settings.toggleSystemTheme());

  SettingsState changeBackupDir(Directory newDir) =>
      copyWith(settings: settings.changeBackupDir(newDir));

  SettingsState changeSizeLimits(BookSizeLimits limits) =>
      copyWith(settings: settings.changeSizeLimits(limits));

  SettingsState changeReadingGoal(ReadingGoal goal) =>
      copyWith(settings: settings.changeReadingGoal(goal));

  bool get useDarkTheme => settings.useDarkTheme;
  bool get useSystemTheme => settings.useSystemTheme;
  Directory get backupsDir => settings.backupsDir;
  BookSizeLimits get bookSizeLimits => settings.bookSizeLimits;
}
