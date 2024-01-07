import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../../core/widgets/menu_button.dart';
import '../../../manage_books/presentation/bloc/listing/books_bloc.dart';
import '../bloc/backup_bloc.dart';

final class RestoreButton extends StatelessWidget {
  const RestoreButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MenuButton(
          text: 'Restore',
          onPressed: () async => await _triggerRestore(context),
        ),
        BlocSelector<BackupBloc, BackupState, bool>(
          selector: (state) => state.isRestoreInProgress,
          builder: (context, isRestoreInProgress) {
            if (!isRestoreInProgress) {
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

  Future<void> _triggerRestore(BuildContext context) async {
    final directory = await getApplicationDocumentsDirectory();
    final backupPath = '${directory.path}/homer-backup.json';
    if (context.mounted) context.restoreBackup(backupPath);
  }
}
