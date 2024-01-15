part of 'stats_bloc.dart';

final class StatsState extends Equatable {
  StatsState.initial()
      : booksPerYear = BooksPerYear(SplayTreeMap.from({}));

  const StatsState.loaded(this.booksPerYear);

  final BooksPerYear booksPerYear;

  List<Year> get years => booksPerYear.years;

  List<BookCounts> get bookCounts => booksPerYear.bookCounts;

  @override
  List<Object> get props => [booksPerYear];
}
