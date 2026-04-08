import 'package:homer/core/entities/book.dart';
import 'package:homer/features/import_export/data/mappers/to_exported_book_dtos.dart';
import 'package:test/test.dart';

import '../../../../test_utils/assertion_helpers.dart';
import '../../../../test_utils/fakes.dart';

void main() {
  group('toExportedBookDTOs', () {
    test('should return empty list when empty list on input', () {
      // given
      final List<Book> input = List.empty();

      // when
      final result = toExportedBookDTOs(input);

      // then
      expect(result.isEmpty, true);
    });
  });

  test('should convert all books to exported book dto', () {
    // given
    final books = [fakeBook(), fakeBook(), fakeBook()];

    // when
    final result = toExportedBookDTOs(books);

    // then
    expect(result[0], exportedDTOFromBook(books[0]));
    expect(result[1], exportedDTOFromBook(books[1]));
    expect(result[2], exportedDTOFromBook(books[2]));
  });
}
