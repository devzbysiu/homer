part of 'backup_and_restore_bloc.dart';

abstract class BackupAndRestoreEvent extends Equatable {
  const BackupAndRestoreEvent();
}

final class RestoreTriggered extends BackupAndRestoreEvent {
  const RestoreTriggered(this.path);

  final String path;

  @override
  List<Object> get props => [path];
}
