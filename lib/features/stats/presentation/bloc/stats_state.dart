part of 'stats_bloc.dart';

final class StatsState extends Equatable {
  const StatsState({required this.booksPerYear});

  const StatsState.initial() : booksPerYear = const None();

  const StatsState.loaded(this.booksPerYear);

  const StatsState.loadFailed() : booksPerYear = const None();

  final Option<BooksPerYearData> booksPerYear;

  @override
  List<Object> get props => [booksPerYear];
}
