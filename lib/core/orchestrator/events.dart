import 'package:equatable/equatable.dart';

abstract class BusEvent extends Equatable {
  const BusEvent();

  @override
  List<Object> get props => [];
}

final class RestoreStarted extends BusEvent {
  const RestoreStarted(this.backupPath);

  final String backupPath;

  @override
  List<Object> get props => [backupPath];
}

final class RestoreFinished extends BusEvent {}
