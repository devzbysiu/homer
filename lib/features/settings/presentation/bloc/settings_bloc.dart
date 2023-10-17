import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'settings_event.dart';
part 'settings_state.dart';

class SettingsBloc extends Bloc<SettingsEvent, SettingsState> {
  SettingsBloc() : super(const SettingsInitial()) {
    on<ThemeToggled>(_onThemeToggled);
  }

  Future<void> _onThemeToggled(
    ThemeToggled event,
    Emitter<SettingsState> emit,
  ) {
    final newState = state.isThemeDark ? const LightTheme() : const DarkTheme();
    emit(newState);
    return Future.value();
  }
}
