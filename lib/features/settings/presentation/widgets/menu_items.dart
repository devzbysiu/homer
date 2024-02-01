import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../../core/utils/theme.dart';
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
        spaceBetween(),
        if (kDebugMode) const RestoreButton(),
        if (kDebugMode) spaceBetween(),
        const StatsButton(),
        spaceBetween(),
        const SettingsButton(),
        spaceBetween(),
      ],
    );
  }
}
