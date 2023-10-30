import 'package:file_picker/file_picker.dart';
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
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          final isSystemThemeEnabled = state.isSystemThemeEnabled;
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
                  SettingsTile.switchTile(
                    switchActiveColor: Theme.of(context).colorScheme.primary,
                    title: 'Use system theme',
                    leading: const Icon(Icons.brush),
                    switchValue: isSystemThemeEnabled,
                    onToggle: (_) => context.toggleSystemTheme(),
                  ),
                  SettingsTile(
                    title: 'Backups directory',
                    subtitle: state.backupsDirectory.path,
                    onPressed: _pickBackupsPath,
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _pickBackupsPath(BuildContext context) async {
    final directoryPath = await FilePicker.platform.getDirectoryPath();
    if (directoryPath == null) return Future.value();
    if (context.mounted) context.backupsDirectorySelected(directoryPath);
    return Future.value();
  }
}
