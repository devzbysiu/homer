part of 'backup_and_restore_bloc.dart';

abstract class BackupAndRestoreState extends Equatable {
  const BackupAndRestoreState({this.isRestoreInProgress = false});

  final bool isRestoreInProgress;

  @override
  List<Object> get props => [isRestoreInProgress];
}

final class BackupAndRestoreInitial extends BackupAndRestoreState {}

final class FailedToRestoreBooks extends BackupAndRestoreState {}

final class BooksRestored extends BackupAndRestoreState {
  const BooksRestored() : super(isRestoreInProgress: false);
}

final class RestoreInProgress extends BackupAndRestoreState {
  const RestoreInProgress() : super(isRestoreInProgress: true);
}
