import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_multi_slider/flutter_multi_slider.dart';
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
          final isSystemThemeEnabled = state.isSystemThemeOn;
          return SettingsList(
            darkBackgroundColor: Theme.of(context).colorScheme.background,
            lightBackgroundColor: Theme.of(context).colorScheme.background,
            sections: [
              SettingsSection(
                titleTextStyle: Theme.of(context)
                    .textTheme
                    .titleLarge!
                    .copyWith(color: Theme.of(context).colorScheme.primary),
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
                    leading: const Icon(Icons.backup),
                    subtitle: state.backupsDirectory.path,
                    onPressed: _pickBackupsPath,
                  ),
                  const CustomTile(child: _BookSizeSlider()),
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

class _BookSizeSlider extends StatefulWidget {
  const _BookSizeSlider();

  @override
  State<_BookSizeSlider> createState() => _BookSizeSliderState();
}

class _BookSizeSliderState extends State<_BookSizeSlider> {
  List<double>? componentBookSizeLimits;

  @override
  Widget build(BuildContext context) {
    componentBookSizeLimits ??= context.bookSizeLimits();
    return ListTile(
      contentPadding: const EdgeInsets.only(top: 10, left: 15, right: 25),
      leading: const Icon(Icons.menu_book_rounded),
      title: const Text('Book size limits'),
      subtitle: MultiSlider(
        textHeightOffset: -25,
        horizontalPadding: 0,
        indicator: (_) => IndicatorOptions(
          formatter: (value) => value.toInt().toString(),
        ),
        selectedIndicator: (_) => IndicatorOptions(
          formatter: (value) => value.toInt().toString(),
        ),
        rangeColors: const [Colors.green, Colors.blue, Colors.orange],
        min: 1,
        max: 1244,
        values: componentBookSizeLimits!,
        onChanged: (value) => setState(() => componentBookSizeLimits = value),
        onChangeEnd: (value) => context.bookSizeLimitsChanged(value),
        divisions: 240,
      ),
    );
  }
}
