import 'package:freezed_annotation/freezed_annotation.dart';

part 'events.freezed.dart';

abstract class BusEvent {}

// TODO: Why it is here? Is this the correct place?
@freezed
abstract class ImportFinished with _$ImportFinished implements BusEvent {
  const factory ImportFinished() = _ImportFinished;
}

@freezed
abstract class DeleteBooksFinished
    with _$DeleteBooksFinished
    implements BusEvent {
  const factory DeleteBooksFinished() = _DeleteBooksFinished;
}
