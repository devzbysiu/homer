part of 'backup_bloc.dart';

final class BackupState extends Equatable {
  const BackupState.initial() : _state = State.initial;

  const BackupState.restoreInProgress() : _state = State.restoreInProgress;

  const BackupState.restoreFinished() : _state = State.restoreFinished;

  const BackupState.restoreFailed() : _state = State.restoreFailed;

  const BackupState.backupInProgress() : _state = State.backupInProgress;

  const BackupState.backupFinished() : _state = State.backupFinished;

  const BackupState.backupFailed() : _state = State.backupFailed;

  final State _state;

  bool get isBackupInProgress => _state == State.backupInProgress;

  bool get isRestoreInProgress => _state == State.restoreInProgress;

  @override
  List<Object> get props => [_state];
}

enum State {
  initial,
  restoreInProgress,
  restoreFinished,
  restoreFailed,
  backupInProgress,
  backupFinished,
  backupFailed,
}
