import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/orchestrator/events.dart';
import 'import_books_tile_theme.dart';
import '../../../../logger.dart';

final class ImportBooksTile extends StatelessBusWidget {
  ImportBooksTile({super.key, super.bus});

  @override
  Widget build(BuildContext context) {
    final t = context.importBooksTileTheme;
    return Material(
      child: ListTile(
        contentPadding: EdgeInsets.only(
          top: t.contentPaddingTop,
          left: t.contentPaddingLeft,
          right: t.contentPaddingRight,
        ),
        leading: const Icon(Icons.download),
        title: Padding(
          padding: EdgeInsets.only(left: t.titleLeftPadding),
          child: InkWell(
            splashColor: t.splashColor,
            onTap: () => _openFilePicker(context),
            child: Text('Import books', style: t.titleStyle),
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
