import 'package:flutter/material.dart';

import 'logs_button.dart';
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
        RestoreButton(),
        const StatsButton(),
        const SettingsButton(),
        const FeedbackButton(),
        const LogsButton(),
      ],
    );
  }
}
