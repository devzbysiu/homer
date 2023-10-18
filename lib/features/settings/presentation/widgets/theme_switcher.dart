import 'package:day_night_switcher/day_night_switcher.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/extensions/settings_context_ext.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    return DayNightSwitcher(
      isDarkModeEnabled: context.isThemeDark(),
      onStateChanged: (_) => context.toggleTheme(),
    );
  }
}
