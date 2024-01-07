import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../../core/widgets/menu_button.dart';
import '../../../manage_books/presentation/bloc/listing/books_bloc.dart';
import '../../../settings/presentation/bloc/settings_bloc.dart';
import '../bloc/backup_bloc.dart';

final class BackupButton extends StatelessWidget {
  const BackupButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BlocSelector<SettingsBloc, SettingsState, Directory>(
          selector: (state) => state.backupsDirectory,
          builder: (context, backupDirectory) {
            return MenuButton(
              text: 'Backup',
              onPressed: () async => await _triggerBackup(
                backupDirectory,
                context,
              ),
            );
          },
        ),
        BlocSelector<BackupBloc, BackupState, bool>(
          selector: (state) => state.isBackupInProgress,
          builder: (context, isBackupInProgress) {
            if (!isBackupInProgress) {
              context.refreshBooksList();
              return const SizedBox.shrink();
            }
            return JumpingDotsProgressIndicator(
              fontSize: 30,
              color: Theme.of(context).textTheme.headlineMedium!.color!,
            );
          },
        ),
      ],
    );
  }

  Future<void> _triggerBackup(Directory directory, BuildContext context) async {
    final backupPath = '${directory.path}/homer-backup.json';
    if (context.mounted) context.createBackup(backupPath);
  }
}
