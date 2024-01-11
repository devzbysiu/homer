import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/book_size_limits.dart';
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
      (settings) => emit(SettingsState(
        isDarkThemeOn: settings.isDarkThemeOn,
        isSystemThemeOn: settings.isSystemThemeOn,
        backupsDirectory: settings.backupsDirectory,
        bookSizeLimits: settings.bookSizeLimits,
      )),
      (error) => emit(FailedToLoadSettings()),
    );
  }

  void _onThemeToggled(
    ThemeToggled event,
    Emitter<SettingsState> emit,
  ) {
    final newState = state.copyWith(isDarkThemeOn: !state.isDarkThemeOn);
    saveSettings(newState.toParams());
    emit(newState);
  }

  void _onSystemThemeToggled(
    SystemThemeToggled event,
    Emitter<SettingsState> emit,
  ) {
    final newState = state.copyWith(isSystemThemeOn: !state.isSystemThemeOn);
    saveSettings(newState.toParams());
    emit(newState);
  }

  void _onBackupPathSelected(
    BackupsDirectorySelected event,
    Emitter<SettingsState> emit,
  ) {
    final newState = state.copyWith(backupsDirectory: event.directory);
    saveSettings(newState.toParams());
    emit(newState);
  }

  void _onBookSizeLimitsChanged(
    BookSizeLimitsChanged event,
    Emitter<SettingsState> emit,
  ) {
    final newState = state.copyWith(bookSizeLimits: event.limits);
    saveSettings(newState.toParams());
    emit(newState);
  }
}

extension SettingsContextExt on BuildContext {
  void toggleTheme() {
    _emitSettingsEvt(ThemeToggled());
  }

  void toggleSystemTheme() {
    _emitSettingsEvt(SystemThemeToggled());
  }

  void backupsDirectorySelected(Directory directory) {
    _emitSettingsEvt(BackupsDirectorySelected(directory));
  }

  void bookSizeLimitsChanged(BookSizeLimits limits) {
    _emitSettingsEvt(BookSizeLimitsChanged(limits));
  }

  BookSizeLimits bookSizeLimits() {
    return read<SettingsBloc>().state.bookSizeLimits;
  }

  void _emitSettingsEvt(SettingsEvent event) {
    read<SettingsBloc>().add(event);
  }
}

extension _SettingsStateExt on SettingsState {
  SettingsParams toParams() {
    return SettingsParams(
      settings: Settings(
        isSystemThemeOn: isSystemThemeOn,
        isDarkThemeOn: isDarkThemeOn,
        backupsDirectory: backupsDirectory,
        bookSizeLimits: bookSizeLimits,
      ),
    );
  }
}
