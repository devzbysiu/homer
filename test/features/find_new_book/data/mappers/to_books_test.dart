import 'package:homer/features/find_new_book/data/mappers/to_books.dart';
import 'package:homer/features/find_new_book/data/models/external_book_dto.dart';
import 'package:test/test.dart';

import '../../../../test_utils.dart';

void main() {
  group('toBooks', () {
    test('should return empty list when empty list on input', () {
      // given
      final List<ExternalBookDTO> input = List.empty();

      // when
      final result = toBooks(input);

      // then
      expect(result.isEmpty, true);
    });
  });

  test('should convert all dtos to books', () {
    // given
    final bookDTOs = [
      fakeRemoteBookDTO(),
      fakeRemoteBookDTO(),
      fakeRemoteBookDTO(),
    ];

    // when
    final result = toBooks(bookDTOs);

    // then
    expect(result[0], bookFromRemoteDTO(bookDTOs[0]));
    expect(result[1], bookFromRemoteDTO(bookDTOs[1]));
    expect(result[2], bookFromRemoteDTO(bookDTOs[2]));
  });
}
