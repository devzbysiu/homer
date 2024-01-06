part of 'backup_bloc.dart';

final class BackupState extends Equatable {
  const BackupState.initial() : _value = Value.initial;

  const BackupState.restoreInProgress() : _value = Value.restoreInProgress;

  const BackupState.restoreFinished() : _value = Value.restoreFinished;

  const BackupState.restoreFailed() : _value = Value.restoreFailed;

  const BackupState.backupInProgress() : _value = Value.backupInProgress;

  const BackupState.backupFinished() : _value = Value.backupFinished;

  const BackupState.backupFailed() : _value = Value.backupFailed;

  final Value _value;

  bool get isBackupInProgress => _value == Value.backupInProgress;

  bool get isRestoreInProgress => _value == Value.restoreInProgress;

  @override
  List<Object> get props => [_value];
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
