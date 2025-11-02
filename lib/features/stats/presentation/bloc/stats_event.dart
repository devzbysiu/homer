import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/entities/book.dart';

part 'stats_event.freezed.dart';

@freezed
sealed class StatsEvent with _$StatsEvent {
  const factory StatsEvent.loadStats() = LoadStats;

  const factory StatsEvent.bookFinished({required Book book}) = BookFinished;

  const factory StatsEvent.bookUnfinished({required Book book}) =
      BookUnfinished;

  const factory StatsEvent.bookStarted() = BookStarted;

  const factory StatsEvent.bookUnstarted() = BookUnstarted;
}
