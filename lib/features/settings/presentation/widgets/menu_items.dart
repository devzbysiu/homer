import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'stats_button.dart';
import 'backup_button.dart';
import 'feedback_button.dart';
import 'restore_button.dart';
import 'settings_button.dart';

final class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      spacing: 20,
      children: [
        BackupButton(),
        if (kDebugMode) RestoreButton(),
        const StatsButton(),
        const SettingsButton(),
        const FeedbackButton(),
      ],
    );
  }
}
