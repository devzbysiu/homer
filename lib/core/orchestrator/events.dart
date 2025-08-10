import 'package:freezed_annotation/freezed_annotation.dart';

part 'events.freezed.dart';

abstract class BusEvent {}

// TODO: Why it is here? Is this the correct place?
@freezed
abstract class RestoreFinished with _$RestoreFinished implements BusEvent {
  const factory RestoreFinished() = _RestoreFinished;
}

@freezed
abstract class DeleteBooksFinished
    with _$DeleteBooksFinished
    implements BusEvent {
  const factory DeleteBooksFinished() = _DeleteBooksFinished;
}
