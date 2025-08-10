import 'package:dartz/dartz.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/entities/books_per_month_data.dart';
import '../../domain/entities/books_per_state_data.dart';
import '../../domain/entities/books_per_year_data.dart';
import '../../domain/entities/other_stats_data.dart';

part 'stats_state.freezed.dart';

@freezed
class StatsState with _$StatsState {
  const StatsState._(); // enables custom getters/methods if you add any later

  const factory StatsState({
    required Option<BooksPerYearData> booksPerYear,
    required Option<BooksPerMonthData> booksPerMonth,
    required Option<BooksPerStateData> booksPerState,
    required Option<OtherStatsData> otherStats,
  }) = _StatsState;

  factory StatsState.initial() => const StatsState(
    booksPerYear: None(),
    booksPerMonth: None(),
    booksPerState: None(),
    otherStats: None(),
  );

  factory StatsState.loaded({
    required BooksPerYearData booksPerYear,
    required BooksPerMonthData booksPerMonth,
    required BooksPerStateData booksPerState,
    required OtherStatsData otherStats,
  }) => StatsState(
    booksPerYear: Some(booksPerYear),
    booksPerMonth: Some(booksPerMonth),
    booksPerState: Some(booksPerState),
    otherStats: Some(otherStats),
  );

  factory StatsState.loadFailed() => const StatsState(
    booksPerYear: None(),
    booksPerMonth: None(),
    booksPerState: None(),
    otherStats: None(),
  );
}
