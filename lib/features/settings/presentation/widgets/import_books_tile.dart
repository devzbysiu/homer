import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/orchestrator/events.dart';
import '../../../../core/utils/theme.dart';
import '../../../../logger.dart';

final class ImportBooksTile extends StatelessBusWidget {
  ImportBooksTile({super.key, super.bus});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 10, left: 23, right: 25),
        leading: const Icon(Icons.download),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            splashColor: context.primaryContainer,
            onTap: () => _openFilePicker(context),
            child: Text('Import books', style: context.headlineSmall),
          ),
        ),
      ),
    );
  }

  Future<void> _openFilePicker(BuildContext context) async {
    final selection = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['json'],
      allowMultiple: false,
    );
    if (selection == null || selection.files.isEmpty) {
      log.info('No file was selected, skipping import');
      return;
    }
    assert(selection.files.length == 1);
    // TODO: Error checking is needed here
    final jsonFilePath = selection.files[0].path!;
    fire($ImportTriggered(path: jsonFilePath));
  }
}
