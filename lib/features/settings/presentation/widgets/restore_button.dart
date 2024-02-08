import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:path_provider/path_provider.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/utils/theme.dart';
import '../../../../core/widgets/menu_button.dart';
import '../../../backup_and_restore/presentation/bloc/backup_bloc.dart';

final class RestoreButton extends StatelessBusWidget {
  RestoreButton({super.key, super.bus});

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
            if (!isRestoreInProgress) return const SizedBox.shrink();
            return JumpingDotsProgressIndicator(
              fontSize: 30,
              color: context.headlineMediumColor,
            );
          },
        ),
      ],
    );
  }

  Future<void> _triggerRestore(BuildContext context) async {
    final directory = await getApplicationDocumentsDirectory();
    final backupPath = '${directory.path}/homer-backup.json';
    fire(RestoreTriggered(backupPath));
  }
}
