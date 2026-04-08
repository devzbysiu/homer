import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/book.dart';

part 'book_summary_state.freezed.dart';

enum SummaryMode { initial, enabled, disabled, disabling }

@freezed
sealed class BookSummaryState with _$BookSummaryState {
  const BookSummaryState._(); // enables the getters below

  const factory BookSummaryState.initial() = Initial;

  const factory BookSummaryState.enabled(Book book) = Enabled;

  const factory BookSummaryState.disabled() = Disabled;

  const factory BookSummaryState.disabling(Option<Book> current) = Disabling;

  Option<Book> get current => when(
    initial: () => const None(),
    enabled: (b) => some(b),
    disabled: () => const None(),
    disabling: (_) => const None(),
  );

  Option<Book> get previous => when(
    initial: () => const None(),
    enabled: (_) => const None(),
    disabled: () => const None(),
    disabling: (curr) => curr,
  );

  SummaryMode get mode => when(
    initial: () => SummaryMode.initial,
    enabled: (_) => SummaryMode.enabled,
    disabled: () => SummaryMode.disabled,
    disabling: (_) => SummaryMode.disabling,
  );
}
