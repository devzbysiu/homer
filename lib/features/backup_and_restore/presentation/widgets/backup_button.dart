import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../../core/orchestrator/bus.dart';
import '../../../../core/utils/theme.dart';
import '../../../../core/widgets/menu_button.dart';
import '../../../../injection_container.dart';
import '../../../settings/presentation/bloc/settings_bloc.dart';
import '../bloc/backup_bloc.dart';

final class BackupButton extends StatelessWidget {
  BackupButton({super.key, Bus? eventBus}) : _eventBus = eventBus ?? sl<Bus>();

  final Bus _eventBus;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocSelector<SettingsBloc, SettingsState, Directory>(
          selector: (state) => state.backupsDir,
          builder: (context, backupDirectory) {
            return MenuButton(
              text: 'Backup',
              onPressed: () => _triggerBackup(backupDirectory, context),
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

  void _triggerBackup(Directory directory, BuildContext context) {
    final backupPath = '${directory.path}/homer-backup.json';
    _eventBus.fire(BackupTriggered(backupPath));
  }
}
