part of 'stats_bloc.dart';

final class StatsState extends Equatable {
  const StatsState({
    required this.booksPerYear,
    required this.booksPerMonth,
    required this.booksPerState,
    required this.otherStats,
  });

  const StatsState.initial()
      : booksPerYear = const None(),
        booksPerMonth = const None(),
        booksPerState = const None(),
        otherStats = const None();

  const StatsState.loaded(
    this.booksPerYear,
    this.booksPerMonth,
    this.booksPerState,
    this.otherStats,
  );

  const StatsState.loadFailed()
      : booksPerYear = const None(),
        booksPerMonth = const None(),
        booksPerState = const None(),
        otherStats = const None();

  final Option<BooksPerYearData> booksPerYear;

  final Option<BooksPerMonthData> booksPerMonth;

  final Option<BooksPerStateData> booksPerState;

  final Option<OtherStatsData> otherStats;

  @override
  List<Object> get props => [
        booksPerYear,
        booksPerMonth,
        booksPerState,
        otherStats,
      ];
}
