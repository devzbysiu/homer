import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:progress_indicators/progress_indicators.dart';

import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/utils/theme.dart';
import '../../../../core/widgets/menu_button.dart';
import '../../../backup_and_restore/presentation/bloc/backup_bloc.dart';
import '../../../backup_and_restore/presentation/bloc/backup_event.dart';
import '../../../backup_and_restore/presentation/bloc/backup_state.dart';

final class RestoreButton extends StatelessBusWidget {
  RestoreButton({super.key, super.bus});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MenuButton(
          text: 'Restore',
          onPressed: () async => await _openFilePicker(context),
        ),
        BlocSelector<BackupBloc, BackupState, bool>(
          selector: (state) => state is RestoreInProgress,
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

  Future<void> _openFilePicker(BuildContext context) async {
    final selection = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      allowMultiple: false,
    );
    if (selection == null || selection.files.isEmpty) {
      // TODO: Error handling is needed here
      return;
    }
    assert(selection.files.length == 1);
    // TODO: Error checking is needed here
    final jsonFilePath = selection.files[0].path!;
    fire(RestoreTriggered(path: jsonFilePath));
  }
}
