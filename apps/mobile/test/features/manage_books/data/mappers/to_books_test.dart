import 'package:homer/features/manage_books/data/mappers/to_books.dart';
import 'package:homer/features/manage_books/data/models/book_dto.dart';
import 'package:test/test.dart';

import '../../../../test_utils/assertion_helpers.dart';
import '../../../../test_utils/fakes.dart';

void main() {
  group('toBooks', () {
    test('should return empty list when empty list on input', () {
      // given
      final List<BookDTO> input = List.empty();

      // when
      final result = toBooks(input);

      // then
      expect(result.isEmpty, true);
    });
  });

  test('should convert all dtos to books', () {
    // given
    final bookDTOs = [fakeBookDTO(), fakeBookDTO(), fakeBookDTO()];

    // when
    final result = toBooks(bookDTOs);

    // then
    expect(result[0], bookFromBookDTO(bookDTOs[0]));
    expect(result[1], bookFromBookDTO(bookDTOs[1]));
    expect(result[2], bookFromBookDTO(bookDTOs[2]));
  });
}
