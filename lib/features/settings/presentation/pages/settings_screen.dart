import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import '../bloc/settings_bloc.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect()],
      child: BlocSelector<SettingsBloc, SettingsState, bool>(
        selector: (state) => state.isSystemThemeEnabled,
        builder: (context, isSystemThemeEnabled) {
          return SettingsList(
            darkBackgroundColor: Theme.of(context).colorScheme.background,
            lightBackgroundColor: Theme.of(context).colorScheme.background,
            sections: [
              SettingsSection(
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
                title: 'Section',
                tiles: [
                  SettingsTile(
                    title: 'Language',
                    subtitle: 'English',
                    leading: const Icon(Icons.language),
                    onPressed: (BuildContext context) {},
                  ),
                  SettingsTile.switchTile(
                    switchActiveColor: Theme.of(context).colorScheme.primary,
                    title: 'Use system theme',
                    leading: const Icon(Icons.brush),
                    switchValue: isSystemThemeEnabled,
                    onToggle: (_) => context.toggleSystemTheme(),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }
}
