import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/settings_bloc.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<SettingsBloc, SettingsState, bool>(
      selector: (state) => state.isThemeDark,
      builder: (context, isThemeDark) {
        return DayNightSwitcher(
          isDarkModeEnabled: isThemeDark,
          onStateChanged: (_) => context.toggleTheme(),
        );
      },
    );
  }
}
