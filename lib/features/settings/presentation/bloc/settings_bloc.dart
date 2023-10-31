import 'dart:async';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/load_settings.dart';
import '../../domain/usecases/save_settings.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc({
    required this.saveSettings,
    required this.loadSettings,
  }) : super(SettingsInitial()) {
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
      (settings) => emit(Settings(
        isDarkThemeOn: settings.isDarkThemeOn,
        isSystemThemeOn: settings.isSystemThemeOn,
        backupsDirectory: settings.backupsDirectory,
        bookSizeLimits: settings.bookSizeLimits,
      )),
      (error) => emit(FailedToLoadSettings()),
    );
    return Future.value();
  }

  Future<void> _onThemeToggled(
    ThemeToggled event,
    Emitter<SettingsState> emit,
  ) {
    final newState = Settings(
      isDarkThemeOn: !state.isDarkThemeOn,
      isSystemThemeOn: state.isSystemThemeOn,
      backupsDirectory: state.backupsDirectory,
      bookSizeLimits: state.bookSizeLimits,
    );
    saveSettings(SaveSettingsParams(
      isDarkThemeOn: newState.isDarkThemeOn,
      isSystemThemeOn: newState.isSystemThemeOn,
      backupsDirectory: newState.backupsDirectory,
      bookSizeLimits: newState.bookSizeLimits,
    ));
    emit(newState);
    return Future.value();
  }

  Future<void> _onSystemThemeToggled(
    SystemThemeToggled event,
    Emitter<SettingsState> emit,
  ) async {
    final newState = Settings(
      isDarkThemeOn: state.isDarkThemeOn,
      isSystemThemeOn: !state.isSystemThemeOn,
      backupsDirectory: state.backupsDirectory,
      bookSizeLimits: state.bookSizeLimits,
    );
    saveSettings(SaveSettingsParams(
      isDarkThemeOn: newState.isDarkThemeOn,
      isSystemThemeOn: newState.isSystemThemeOn,
      backupsDirectory: newState.backupsDirectory,
      bookSizeLimits: newState.bookSizeLimits,
    ));
    emit(newState);
    return Future.value();
  }

  Future<void> _onBackupPathSelected(
    BackupsDirectorySelected event,
    Emitter<SettingsState> emit,
  ) async {
    emit(Settings(
      isDarkThemeOn: state.isDarkThemeOn,
      isSystemThemeOn: state.isSystemThemeOn,
      backupsDirectory: Directory(event.directory),
      bookSizeLimits: state.bookSizeLimits,
    ));
    saveSettings(SaveSettingsParams(
      isDarkThemeOn: state.isDarkThemeOn,
      isSystemThemeOn: state.isSystemThemeOn,
      backupsDirectory: state.backupsDirectory,
      bookSizeLimits: state.bookSizeLimits,
    ));
    return Future.value();
  }

  Future<void> _onBookSizeLimitsChanged(
    BookSizeLimitsChanged event,
    Emitter<SettingsState> emit,
  ) async {
    emit(Settings(
      isDarkThemeOn: state.isDarkThemeOn,
      isSystemThemeOn: state.isSystemThemeOn,
      backupsDirectory: state.backupsDirectory,
      bookSizeLimits: event.limits,
    ));
    saveSettings(SaveSettingsParams(
      isDarkThemeOn: state.isDarkThemeOn,
      isSystemThemeOn: state.isSystemThemeOn,
      backupsDirectory: state.backupsDirectory,
      bookSizeLimits: state.bookSizeLimits,
    ));
    return Future.value();
  }
}

extension SettingsContextExt on BuildContext {
  void toggleTheme() {
    _emitSettingsEvt(ThemeToggled());
  }

  void toggleSystemTheme() {
    _emitSettingsEvt(SystemThemeToggled());
  }

  void backupsDirectorySelected(String path) {
    _emitSettingsEvt(BackupsDirectorySelected(path));
  }

  void bookSizeLimitsChanged(List<double> limits) {
    _emitSettingsEvt(BookSizeLimitsChanged(limits));
  }

  List<double> bookSizeLimits() {
    return read<SettingsBloc>().state.bookSizeLimits;
  }

  void _emitSettingsEvt(SettingsEvent event) {
    read<SettingsBloc>().add(event);
  }
}
