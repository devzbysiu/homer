part of 'backup_bloc.dart';

abstract class BackupState extends Equatable {
  const BackupState({this.isRestoreInProgress = false});

  final bool isRestoreInProgress;

  @override
  List<Object> get props => [isRestoreInProgress];
}

final class BackupAndRestoreInitial extends BackupState {}

final class FailedToRestoreBooks extends BackupState {}

final class BooksRestored extends BackupState {
  const BooksRestored() : super(isRestoreInProgress: false);
}

final class RestoreInProgress extends BackupState {
  const RestoreInProgress() : super(isRestoreInProgress: true);
}
