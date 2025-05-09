import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/utils/theme.dart';
import '../../../../core/widgets/menu_button.dart';
import '../../../backup_and_restore/presentation/bloc/backup_bloc.dart';
import '../../../settings/presentation/bloc/settings_bloc.dart';

final class BackupButton extends StatelessBusWidget {
  BackupButton({super.key, super.bus});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocSelector<SettingsBloc, SettingsState, Directory>(
          selector: (state) => state.backupsDir,
          builder: (context, backupDirectory) {
            return MenuButton(
              text: 'Backup',
              onPressed: () => _triggerBackup(backupDirectory),
            );
          },
        ),
        BlocSelector<BackupBloc, BackupState, bool>(
          selector: (state) => state.isBackupInProgress,
          builder: (context, isBackupInProgress) {
            if (!isBackupInProgress) return const SizedBox.shrink();
            return JumpingDotsProgressIndicator(
              fontSize: 30,
              color: context.headlineMedium.color!,
            );
          },
        ),
      ],
    );
  }

  void _triggerBackup(Directory directory) {
    final backupPath = '${directory.path}/homer-backup.json';
    fire(BackupTriggered(backupPath));
  }
}
