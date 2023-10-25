import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../../core/utils/extensions/backup_and_restore_context_ext.dart';
import '../../../../core/utils/extensions/books_context_ext.dart';

class MenuItems extends StatelessWidget {
  const MenuItems({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const _BackupButton(),
        const SizedBox(height: 20),
        const _RestoreButton(),
        const SizedBox(height: 20),
        _SettingButton(
          text: 'Stats',
          onPressed: () {},
        ),
        const SizedBox(height: 20),
        _SettingButton(
          text: 'Settings',
          onPressed: () {},
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

final class _RestoreButton extends StatelessWidget {
  const _RestoreButton();

  @override
  Widget build(BuildContext context) {
    final isRestoreInProgress = context.isRestoreInProgress();
    if (!isRestoreInProgress) context.refreshBooksList();
    return Row(
      children: [
        _SettingButton(
          text: 'Restore',
          onPressed: () async => await _triggerRestore(context),
        ),
        if (isRestoreInProgress)
          JumpingDotsProgressIndicator(
            fontSize: 30,
            color: Theme.of(context).textTheme.headlineMedium!.color!,
          ),
      ],
    );
  }

  Future<void> _triggerRestore(BuildContext context) async {
    final directory = await getApplicationDocumentsDirectory();
    final backupPath = '${directory.path}/homer-backup.json';
    if (context.mounted) context.restoreBackup(backupPath);
    return Future.value();
  }
}

final class _SettingButton extends StatelessWidget {
  const _SettingButton({required this.text, required this.onPressed});

  final String text;

  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Theme.of(context).colorScheme.primaryContainer,
      onTap: onPressed,
      child: Text(
        text,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}

final class _BackupButton extends StatelessWidget {
  const _BackupButton();

  @override
  Widget build(BuildContext context) {
    // TODO: Should backupInProgress be Option<bool>?
    final isBackupInProgress = context.isBackupInProgress();
    if (!isBackupInProgress) context.refreshBooksList();
    return Row(
      children: [
        _SettingButton(
          text: 'Backup',
          onPressed: () async => await _triggerBackup(context),
        ),
        if (isBackupInProgress)
          JumpingDotsProgressIndicator(
            fontSize: 30,
            color: Theme.of(context).textTheme.headlineMedium!.color!,
          ),
      ],
    );
  }

  Future<void> _triggerBackup(BuildContext context) async {
    final directory = await getApplicationDocumentsDirectory();
    final backupPath = '${directory.path}/homer-backup.json';
    if (context.mounted) context.createBackup(backupPath);
    return Future.value();
  }
}
