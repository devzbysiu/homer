import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as p;

import '../../../../core/orchestrator/bus_widget.dart';
import '../../../../core/orchestrator/events.dart';
import '../../../../core/utils/theme.dart';

final class ExportBooksTile extends StatelessBusWidget {
  ExportBooksTile({super.key, super.bus});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListTile(
        contentPadding: const EdgeInsets.only(top: 10, left: 23, right: 25),
        leading: const Icon(Icons.upload),
        title: Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: InkWell(
            splashColor: context.primaryContainer,
            onTap: () => _openFilePicker(context),
            child: Text('Export books', style: context.headlineSmall),
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
