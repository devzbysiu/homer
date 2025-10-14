import 'package:freezed_annotation/freezed_annotation.dart';

part 'events.freezed.dart';

abstract class BusEvent {}

// INFO: The events below are the events coordinating different BLoCs
// - that's why those are here and not as part of a BLoC
// ===========================[   Events   ]===========================

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
