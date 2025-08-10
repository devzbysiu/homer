import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/orchestrator/events.dart';

part 'stats_event.freezed.dart';

@freezed
sealed class StatsEvent with _$StatsEvent implements BusEvent {
  const factory StatsEvent.loadStats() = LoadStats;

  const factory StatsEvent.bookFinished(Book book) = BookFinished;

  const factory StatsEvent.bookUnfinished(Book book) = BookUnfinished;

  const factory StatsEvent.bookStarted() = BookStarted;

  const factory StatsEvent.bookUnstarted() = BookUnstarted;
}
