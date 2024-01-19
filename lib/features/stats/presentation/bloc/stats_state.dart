part of 'stats_bloc.dart';

final class StatsState extends Equatable {
  const StatsState({required this.booksPerYear, required this.booksPerMonth});

  const StatsState.initial()
      : booksPerYear = const None(),
        booksPerMonth = const None();

  const StatsState.loaded(this.booksPerYear, this.booksPerMonth);

  const StatsState.loadFailed()
      : booksPerYear = const None(),
        booksPerMonth = const None();

  final Option<BooksPerYearData> booksPerYear;

  final Option<BooksPerMonthData> booksPerMonth;

  @override
  List<Object> get props => [booksPerYear, booksPerMonth];
}
