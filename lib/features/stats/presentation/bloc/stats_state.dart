part of 'stats_bloc.dart';

typedef Year = int;

typedef BookCounts = int;

final class StatsState extends Equatable {
  const StatsState.initial()
      : years = const [2021, 2022, 2023, 2024],
        bookCounts = const [23, 73, 90, 6];

  final List<Year> years;

  final List<BookCounts> bookCounts;

  @override
  List<Object> get props => [years, bookCounts];
}
