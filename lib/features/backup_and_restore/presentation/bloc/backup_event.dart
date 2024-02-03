part of 'backup_bloc.dart';

abstract class BackupEvent extends Equatable implements BusEvent {
  const BackupEvent(this.path);

  final String path;

  @override
  List<Object> get props => [path];
}

final class RestoreTriggered extends BackupEvent {
  const RestoreTriggered(super.path);
}

final class BackupTriggered extends BackupEvent {
  const BackupTriggered(super.path);
}
