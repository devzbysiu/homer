import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_settings_ui/flutter_settings_ui.dart';

import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/utils/theme.dart';
import '../bloc/settings_bloc.dart';
import '../bloc/settings_event.dart';
import '../bloc/settings_state.dart';
import '../widgets/book_size_slider.dart';
import '../widgets/reading_goal_slider.dart';

final class SettingsScreen extends StatelessBusWidget {
  SettingsScreen({super.key, super.bus});

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: const [FadeEffect()],
      child: BlocBuilder<SettingsBloc, SettingsState>(
        builder: (context, state) => _settingsList(context, state),
      ),
    );
  }

  SettingsList _settingsList(BuildContext context, SettingsState state) {
    return SettingsList(
      contentPadding: const EdgeInsets.only(top: 50),
      darkTheme: _themeBackground(context),
      lightTheme: _themeBackground(context),
      sections: [
        SettingsSection(
          tiles: [
            _useSystemTheme(context, state.useSystemTheme),
            _backupDirPicker(context, state),
            CustomSettingsTile(child: BookSizeSlider()),
            CustomSettingsTile(child: ReadingGoalSlider()),
          ],
        ),
      ],
    );
  }

  SettingsThemeData _themeBackground(BuildContext context) {
    return SettingsThemeData(settingsListBackground: context.background);
  }

  SettingsTile _useSystemTheme(BuildContext context, bool useSystemTheme) {
    return SettingsTile.switchTile(
      activeSwitchColor: context.primary,
      title: Text('Use system theme', style: context.headlineSmall),
      leading: const Icon(Icons.brush),
      initialValue: useSystemTheme,
      onToggle: (_) => fire(SystemThemeToggled()),
    );
  }

  SettingsTile _backupDirPicker(BuildContext context, SettingsState state) {
    return SettingsTile(
      title: Text('Backups directory', style: context.headlineSmall),
      leading: const Icon(Icons.backup),
      description: Text(state.backupsDir.path),
      onPressed: _pickBackupsPath,
    );
  }

  Future<void> _pickBackupsPath(BuildContext context) async {
    final directory = await FilePicker.platform.getDirectoryPath();
    if (directory == null) return;
    fire(BackupsDirPicked(Directory(directory)));
  }
}
