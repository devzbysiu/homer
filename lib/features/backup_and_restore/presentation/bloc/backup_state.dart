part of 'backup_bloc.dart';

abstract class BackupState extends Equatable {
  const BackupState({
    this.isRestoreInProgress = false,
    this.isBackupInProgress = false,
  });

  final bool isRestoreInProgress;

  final bool isBackupInProgress;

  @override
  List<Object> get props => [isRestoreInProgress, isBackupInProgress];
}

final class BackupAndRestoreInitial extends BackupState {}

final class FailedToRestoreBooks extends BackupState {}

final class RestoreFinished extends BackupState {
  const RestoreFinished() : super(isRestoreInProgress: false);
}

final class RestoreInProgress extends BackupState {
  const RestoreInProgress() : super(isRestoreInProgress: true);
}

final class BackupInProgress extends BackupState {
  const BackupInProgress() : super(isBackupInProgress: true);
}

final class BackupFinished extends BackupState {
  const BackupFinished() : super(isBackupInProgress: false);
}
