import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/orchestrator/bus.dart';
import '../../../../core/orchestrator/events.dart';
import '../../../../injection_container.dart';
import '../bloc/settings_bloc.dart';

final class ThemeSwitcher extends StatelessWidget {
  ThemeSwitcher({super.key, Bus? eventBus}) : _eventBus = eventBus ?? sl<Bus>();

  final Bus _eventBus;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.useSystemTheme
            ? const SizedBox.shrink()
            : DayNightSwitcher(
                isDarkModeEnabled: state.useDarkTheme,
                onStateChanged: (_) => _eventBus.fire(ThemeChanged()));
      },
    );
  }
}
