import 'package:homer/core/entities/book.dart';
import 'package:homer/features/manage_books/data/mappers/to_book_dtos.dart';
import 'package:test/test.dart';

import '../../../../test_utils/assertion_helpers.dart';
import '../../../../test_utils/fakes.dart';

void main() {
  group('toBookDTOs', () {
    test('should return empty list when empty list on input', () {
      // given
      final List<Book> input = List.empty();

      // when
      final result = toBookDTOs(input);

      // then
      expect(result.isEmpty, true);
    });

    test('should return valid book dtos', () {
      // given
      final books = [fakeBook(), fakeBook(), fakeBook()];

      // when
      final result = toBookDTOs(books);

      // then
      expect(result[0], bookDTOFromBook(books[0]));
      expect(result[1], bookDTOFromBook(books[1]));
      expect(result[2], bookDTOFromBook(books[2]));
    });
  });
}
