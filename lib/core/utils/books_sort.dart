import '../../features/manage_books/domain/entities/local_book.dart';
import 'date_option_ext.dart';

List<LocalBook> sortByStateAndDate(List<LocalBook> books) {
  final List<LocalBook> filteredAndSorted = books
      .where((book) => book.state == BookState.readLater)
      .toList()
      .reversed
      .toList();

  final List<LocalBook> readingBooks =
      books.where((book) => book.state == BookState.reading).toList();

  final List<LocalBook> readBooks =
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
