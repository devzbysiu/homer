part of 'backup_bloc.dart';

abstract class BackupEvent extends Equatable {
  const BackupEvent();
}

final class RestoreTriggered extends BackupEvent {
  const RestoreTriggered(this.path);

  final String path;

  @override
  List<Object> get props => [path];
}
