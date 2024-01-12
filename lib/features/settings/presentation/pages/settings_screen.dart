import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import '../bloc/settings_bloc.dart';
import '../widgets/book_size_slider.dart';

final class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect()],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) {
          final isSystemThemeEnabled = state.isSystemThemeOn;
          return SettingsList(
            contentPadding: const EdgeInsets.only(top: 50),
            darkTheme: SettingsThemeData(
              settingsListBackground: Theme.of(context).colorScheme.background,
            ),
            lightTheme: SettingsThemeData(
              settingsListBackground: Theme.of(context).colorScheme.background,
            ),
            sections: [
              SettingsSection(
                tiles: [
                  SettingsTile.switchTile(
                    activeSwitchColor: Theme.of(context).colorScheme.primary,
                    title: const Text('Use system theme'),
                    leading: const Icon(Icons.brush),
                    initialValue: isSystemThemeEnabled,
                    onToggle: (_) => context.toggleSystemTheme(),
                  ),
                  SettingsTile(
                    title: const Text('Backups directory'),
                    leading: const Icon(Icons.backup),
                    description: Text(state.backupsDirectory.path),
                    onPressed: _pickBackupsPath,
                  ),
                  const CustomSettingsTile(child: BookSizeSlider()),
                ],
              ),
            ],
          );
        },
      ),
    );
  }

  Future<void> _pickBackupsPath(BuildContext context) async {
    final directory = await FilePicker.platform.getDirectoryPath();
    if (directory == null) return;
    if (context.mounted) context.backupsDirectorySelected(Directory(directory));
  }
}
