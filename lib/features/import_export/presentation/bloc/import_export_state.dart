import 'package:freezed_annotation/freezed_annotation.dart';

part 'import_export_state.freezed.dart';

@freezed
sealed class ImportExportState with _$ImportExportState {
  const factory ImportExportState.initial() = Initial;

  const factory ImportExportState.importInProgress() = ImportInProgress;

  const factory ImportExportState.importDone() = ImportDone;

  const factory ImportExportState.importFailed() = ImportFailed;

  const factory ImportExportState.exportInProgress() = ExportInProgress;

  const factory ImportExportState.exportFinished() = ExportFinished;

  const factory ImportExportState.exportFailed() = ExportFailed;
}
