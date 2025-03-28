import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/theme.dart';
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
      children: [
        BackupButton(),
        spaceBetween(),
        if (kDebugMode) RestoreButton(),
        if (kDebugMode) spaceBetween(),
        const StatsButton(),
        spaceBetween(),
        const SettingsButton(),
        spaceBetween(),
        const FeedbackButton(),
        spaceBetween(),
      ],
    );
  }
}
