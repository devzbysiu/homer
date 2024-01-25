import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/book_size_limits.dart';
import '../../domain/entities/reading_goal.dart';
import '../../domain/entities/settings.dart';
import '../../domain/usecases/load_settings.dart';
import '../../domain/usecases/save_settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

final class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.saveSettings,
    required this.loadSettings,
  }) : super(SettingsState.initial()) {
    on<SettingsLoaded>(_onSettingsLoaded);
    on<ThemeToggled>(_onThemeToggled);
    on<SystemThemeToggled>(_onSystemThemeToggled);
    on<BackupsDirectorySelected>(_onBackupPathSelected);
    on<BookSizeLimitsChanged>(_onBookSizeLimitsChanged);
    on<ReadingGoalChanged>(_onReadingGoalChanged);
    // TODO: Move initial even triggering to `run.dart`
    add(SettingsLoaded());
  }

  final SaveSettings saveSettings;

  final LoadSettings loadSettings;

  Future<void> _onSettingsLoaded(
    SettingsLoaded event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await loadSettings(NoParams());
    result.when(
      (settings) => emit(SettingsState.from(settings)),
      (error) => emit(SettingsState.failedToLoad()),
    );
  }

  void _onThemeToggled(
    ThemeToggled event,
    Emitter<SettingsState> emit,
  ) async {
    final newState = state.toggleDarkTheme();
    await _saveAndEmit(newState, emit);
  }

  Future<void> _saveAndEmit(
    SettingsState newState,
    Emitter<SettingsState> emit,
  ) async {
    final result = await saveSettings(newState.toParams());
    result.when(
      (_) => emit(newState),
      (error) => emit(SettingsState.failedToLoad()),
    );
  }

  void _onSystemThemeToggled(
    SystemThemeToggled event,
    Emitter<SettingsState> emit,
  ) async {
    final newState = state.toggleSystemTheme();
    await _saveAndEmit(newState, emit);
  }

  void _onBackupPathSelected(
    BackupsDirectorySelected event,
    Emitter<SettingsState> emit,
  ) async {
    final newState = state.changeBackupDir(event.directory);
    await _saveAndEmit(newState, emit);
  }

  void _onBookSizeLimitsChanged(
    BookSizeLimitsChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final newState = state.changeSizeLimits(event.limits);
    await _saveAndEmit(newState, emit);
  }

  void _onReadingGoalChanged(
    ReadingGoalChanged event,
    Emitter<SettingsState> emit,
  ) async {
    final newState = state.changeReadingGoal(event.goal);
    await _saveAndEmit(newState, emit);
  }
}

extension SettingsContextExt on BuildContext {
  void toggleTheme() {
    _emitSettingsEvt(ThemeToggled());
  }

  void toggleSystemTheme() {
    _emitSettingsEvt(SystemThemeToggled());
  }

  void backupsDirPicked(Directory directory) {
    _emitSettingsEvt(BackupsDirectorySelected(directory));
  }

  void bookSizeLimitsChanged(BookSizeLimits limits) {
    _emitSettingsEvt(BookSizeLimitsChanged(limits));
  }

  BookSizeLimits bookSizeLimits() {
    return read<SettingsBloc>().state.settings.bookSizeLimits;
  }

  void _emitSettingsEvt(SettingsEvent event) {
    read<SettingsBloc>().add(event);
  }
}

extension _SettingsStateExt on SettingsState {
  SettingsParams toParams() => SettingsParams(settings: settings);
}
