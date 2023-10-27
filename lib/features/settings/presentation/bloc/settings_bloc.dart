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
    add(SettingsLoaded());
  }

  final SaveSettings saveSettings;

  final LoadSettings loadSettings;

  Future<void> _onThemeToggled(
    ThemeToggled event,
    Emitter<SettingsState> emit,
  ) {
    final newState = Settings(
      isSystemThemeEnabled: state.isSystemThemeEnabled,
      isThemeDark: !state.isThemeDark,
    );
    saveSettings(SaveSettingsParams(
      isSystemTheme: newState.isSystemThemeEnabled,
      isDarkTheme: newState.isThemeDark,
    ));
    emit(newState);
    return Future.value();
  }

  Future<void> _onSystemThemeToggled(
    SystemThemeToggled event,
    Emitter<SettingsState> emit,
  ) async {
    final newState = Settings(
      isSystemThemeEnabled: !state.isSystemThemeEnabled,
      isThemeDark: state.isThemeDark,
    );
    saveSettings(SaveSettingsParams(
      isSystemTheme: newState.isSystemThemeEnabled,
      isDarkTheme: newState.isThemeDark,
    ));
    emit(newState);
    return Future.value();
  }

  Future<void> _onSettingsLoaded(
    SettingsLoaded event,
    Emitter<SettingsState> emit,
  ) async {
    final result = await loadSettings(NoParams());
    result.when(
      (settings) => emit(Settings(
        isSystemThemeEnabled: settings.isSystemThemeEnabled,
        isThemeDark: settings.isThemeDark,
      )),
      (error) => emit(FailedToLoadSettings()),
    );
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

  void _emitSettingsEvt(SettingsEvent event) {
    read<SettingsBloc>().add(event);
  }
}
