import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/orchestrator/events.dart';

part 'backup_event.freezed.dart';

@freezed
sealed class BackupEvent with _$BackupEvent implements BusEvent {
  const factory BackupEvent.restoreTriggered({required String path}) =
      RestoreTriggered;
  const factory BackupEvent.backupTriggered({required String path}) =
      BackupTriggered;
}
