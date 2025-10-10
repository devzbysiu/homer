import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/widgets/menu_button.dart';
import '../../../backup_and_restore/presentation/bloc/backup_event.dart';

final class BackupButton extends StatelessBusWidget {
  BackupButton({super.key, super.bus});

  @override
  Widget build(BuildContext context) {
    return MenuButton(
      text: 'Backup',
      onPressed: () => _openFilePicker(context),
    );
  }

  Future<void> _openFilePicker(BuildContext context) async {
    final directory = await FilePicker.platform.getDirectoryPath();
    if (directory == null) return;
    final jsonPath = p.join(directory, 'homer-export.json');
    fire(BackupTriggered(path: jsonPath));
  }
}
