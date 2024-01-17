part of 'backup_bloc.dart';

final class BackupState extends Equatable {
  const BackupState({required this.value});

  const BackupState.initial() : value = Value.initial;

  const BackupState.restoreInProgress() : value = Value.restoreInProgress;

  const BackupState.restoreFinished() : value = Value.restoreFinished;

  const BackupState.restoreFailed() : value = Value.restoreFailed;

  const BackupState.backupInProgress() : value = Value.backupInProgress;

  const BackupState.backupFinished() : value = Value.backupFinished;

  const BackupState.backupFailed() : value = Value.backupFailed;

  final Value value;

  bool get isBackupInProgress => value == Value.backupInProgress;

  bool get isRestoreInProgress => value == Value.restoreInProgress;

  @override
  List<Object> get props => [value];
}

enum Value {
  initial,
  restoreInProgress,
  restoreFinished,
  restoreFailed,
  backupInProgress,
  backupFinished,
  backupFailed,
}
