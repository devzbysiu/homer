import 'package:flutter/material.dart';

import '../../../backup_and_restore/presentation/widgets/backup_button.dart';
import '../../../backup_and_restore/presentation/widgets/restore_button.dart';
import '../../../stats/presentation/widgets/stats_button.dart';
import 'settings_button.dart';

final class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const BackupButton(),
        _spaceBetween(),
        const RestoreButton(),
        _spaceBetween(),
        const StatsButton(),
        _spaceBetween(),
        const SettingsButton(),
        _spaceBetween(),
      ],
    );
  }

  SizedBox _spaceBetween() => const SizedBox(height: 20);
}
