import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/settings_bloc.dart';

final class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SettingsBloc, SettingsState>(
      builder: (context, state) {
        return state.useSystemTheme
            ? const SizedBox.shrink()
            : DayNightSwitcher(
                isDarkModeEnabled: state.useDarkTheme,
                onStateChanged: (_) => context.toggleTheme(),
              );
      },
    );
  }
}
