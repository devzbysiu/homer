part of 'stats_bloc.dart';

final class StatsState extends Equatable {
  const StatsState.initial() : booksPerYear = const None();

  const StatsState.loaded(this.booksPerYear);

  const StatsState.loadFailed() : booksPerYear = const None();

  final Option<BooksPerYear> booksPerYear;

  Option<List<Year>> get years => booksPerYear.map((bpy) => bpy.years);

  Option<List<BookCounts>> get bookCounts {
    return booksPerYear.map((bpy) => bpy.bookCounts);
  }

  @override
  List<Object> get props => [booksPerYear];
}
