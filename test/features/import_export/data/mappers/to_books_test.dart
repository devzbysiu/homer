import 'package:homer/features/import_export/data/mappers/to_books.dart';
import 'package:homer/features/import_export/data/models/exported_book_dto.dart';
import 'package:test/test.dart';

import '../../../../test_utils/assertion_helpers.dart';
import '../../../../test_utils/fakes.dart';

void main() {
  group('toBooks', () {
    test('should return empty list when empty list on input', () {
      // given
      final List<ExportedBookDTO> input = List.empty();

      // when
      final result = toBooks(input);

      // then
      expect(result.isEmpty, true);
    });
  });

  test('should convert all dtos to books', () {
    // given
    final bookDTOs = [
      fakeExportedBookDTO(),
      fakeExportedBookDTO(),
      fakeExportedBookDTO(),
    ];

    // when
    final result = toBooks(bookDTOs);

    // then
    expect(result[0], bookFromExportedBookDTO(bookDTOs[0]));
    expect(result[1], bookFromExportedBookDTO(bookDTOs[1]));
    expect(result[2], bookFromExportedBookDTO(bookDTOs[2]));
  });
}
