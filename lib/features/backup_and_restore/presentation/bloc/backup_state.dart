import 'package:freezed_annotation/freezed_annotation.dart';

part 'backup_state.freezed.dart';

@freezed
sealed class BackupState with _$BackupState {
  const factory BackupState.initial() = Initial;

  const factory BackupState.restoreInProgress() = RestoreInProgress;

  const factory BackupState.restoreDone() = RestoreDone;

  const factory BackupState.restoreFailed() = RestoreFailed;

  const factory BackupState.backupInProgress() = BackupInProgress;

  const factory BackupState.backupFinished() = BackupFinished;

  const factory BackupState.backupFailed() = BackupFailed;
}
