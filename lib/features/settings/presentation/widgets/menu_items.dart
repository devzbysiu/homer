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
        _SettingButton(
          text: 'Backup',
          onPressed: () {},
        ),
        const SizedBox(height: 20),
        const _BackupRestoreButton(),
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

final class _BackupRestoreButton extends StatelessWidget {
  const _BackupRestoreButton();

  @override
  Widget build(BuildContext context) {
    final isRestoreInProgress = context.isRestoreInProgress();
    if (!isRestoreInProgress) context.refreshBooksList();
    return Row(
      children: [
        _SettingButton(
          text: 'Restore',
          onPressed: () async => await _triggerBackupRestore(context),
        ),
        if (isRestoreInProgress)
          JumpingDotsProgressIndicator(
            fontSize: 30,
            color: Theme.of(context).textTheme.bodyMedium!.color!,
          ),
      ],
    );
  }

  // TODO: Update to match reality
  Future<void> _triggerBackupRestore(BuildContext context) async {
    final directory = await getApplicationDocumentsDirectory();
    final backupPath = '${directory.path}/backup.json';
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
