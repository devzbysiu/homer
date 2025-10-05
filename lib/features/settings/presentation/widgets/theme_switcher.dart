import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/orchestrator/bus_widget.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';
import '../bloc/settings_state.dart';

final class ThemeSwitcher extends StatelessBusWidget {
  ThemeSwitcher({super.key, super.bus});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.useSystemTheme
            ? const SizedBox.shrink()
            : DayNightSwitcher(
                isDarkModeEnabled: state.useDarkTheme,
                onStateChanged: (_) => fire(ThemeToggled()),
              );
      },
    );
  }
}
