import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/orchestrator/events.dart';
import 'export_books_tile_theme.dart';

final class ExportBooksTile extends StatelessBusWidget {
  ExportBooksTile({super.key, super.bus});

  @override
  Widget build(BuildContext context) {
    final t = context.exportBooksTileTheme;
    return Material(
      child: ListTile(
        contentPadding: EdgeInsets.only(
          top: t.contentPaddingTop,
          left: t.contentPaddingLeft,
          right: t.contentPaddingRight,
        ),
        leading: const Icon(Icons.upload),
        title: Padding(
          padding: EdgeInsets.only(left: t.titleLeftPadding),
          child: InkWell(
            splashColor: t.splashColor,
            onTap: () => _openFilePicker(context),
            child: Text('Export books', style: t.titleStyle),
          ),
        ),
      ),
    );
  }

  Future<void> _openFilePicker(BuildContext context) async {
    final directory = await FilePicker.platform.getDirectoryPath();
    if (directory == null) return;
    final jsonPath = p.join(directory, 'homer-export.json');
    fire($ExportTriggered(path: jsonPath));
  }
}
