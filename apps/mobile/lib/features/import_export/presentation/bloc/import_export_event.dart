import 'package:freezed_annotation/freezed_annotation.dart';

part 'import_export_event.freezed.dart';

@freezed
sealed class ImportExportEvent with _$ImportExportEvent {
  const factory ImportExportEvent.importTriggered({required String path}) =
      ImportTriggered;
  const factory ImportExportEvent.exportTriggered({required String path}) =
      ExportTriggered;
}
