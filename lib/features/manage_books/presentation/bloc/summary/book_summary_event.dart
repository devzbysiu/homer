import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/book.dart';
import '../../../../../core/orchestrator/events.dart';

part 'book_summary_event.freezed.dart';

@freezed
sealed class BookSummaryEvent with _$BookSummaryEvent implements BusEvent {
  const factory BookSummaryEvent.summaryModeClosing() = SummaryModeClosing;

  const factory BookSummaryEvent.summaryModeToggled(Book book) =
      SummaryModeToggled;

  const factory BookSummaryEvent.summaryModeClosed() = SummaryModeClosed;
}
