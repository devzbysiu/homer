part of 'backup_and_restore_bloc.dart';

abstract class BackupAndRestoreState extends Equatable {
  const BackupAndRestoreState();

  @override
  List<Object> get props => [];
}

final class BackupAndRestoreInitial extends BackupAndRestoreState {}

final class FailedToRestoreBooks extends BackupAndRestoreState {}

final class BooksRestored extends BackupAndRestoreState {}
