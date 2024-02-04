import 'package:equatable/equatable.dart';

abstract class BusEvent extends Equatable {
  const BusEvent();

  @override
  List<Object> get props => [];
}

final class RestoreFinished extends BusEvent {}

final class DeleteBooksFinished extends BusEvent {}
