part of 'stats_bloc.dart';

final class StatsState extends Equatable {
  const StatsState({required this.booksPerYear});

  const StatsState.initial() : booksPerYear = const None();

  const StatsState.loaded(this.booksPerYear);

  const StatsState.loadFailed() : booksPerYear = const None();

  final Option<BooksPerYear> booksPerYear;

  Option<List<Year>> get years => booksPerYear.map((bpy) => bpy.years);

  Option<List<BookCounts>> get bookCounts {
    return booksPerYear.map((bpy) => bpy.bookCounts);
  }

  StatsState bookFinished(Book book) {
    return booksPerYear.fold(
      () => this,
      (bpy) {
        final newBooksPerYear = bpy.add(book);
        return StatsState.loaded(some(newBooksPerYear));
      },
    );
  }

  StatsState undoFinished(Book book) {
    return booksPerYear.fold(
      () => this,
      (bpy) {
        final newBooksPerYear = bpy.remove(book);
        return StatsState.loaded(some(newBooksPerYear));
      },
    );
  }

  @override
  List<Object> get props => [booksPerYear];
}
