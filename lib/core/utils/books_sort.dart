import '../../features/manage_books/domain/entities/book.dart';
import 'date_option_ext.dart';

List<Book> sortByStateAndDate(List<Book> books) {
  final List<Book> filteredAndSorted = books
      .where((book) => book.state == BookState.readLater)
      .toList()
      .reversed
      .toList();

  final List<Book> readingBooks =
      books.where((book) => book.state == BookState.reading).toList();

  final List<Book> readBooks =
      books.where((book) => book.state == BookState.read).toList();

  readingBooks.sort((a, b) {
    final startDateB = b.startDate.millisSinceEpoch();
    final startDateA = a.startDate.millisSinceEpoch();
    return startDateB.compareTo(startDateA);
  });

  readBooks.sort((a, b) {
    final endDateB = b.endDate.millisSinceEpoch();
    final endDateA = a.endDate.millisSinceEpoch();
    return endDateB.compareTo(endDateA);
  });

  filteredAndSorted.addAll(readingBooks);
  filteredAndSorted.addAll(readBooks);
  return filteredAndSorted;
}
