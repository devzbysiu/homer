import 'package:homer/features/backup_and_restore/data/mappers/to_books.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_book_dto.dart';
import 'package:test/test.dart';

import '../../../../test_utils.dart';
import '../../../../test_utils/fakes.dart';

void main() {
  group('toBooks', () {
    test('should return empty list when empty list on input', () {
      // given
      final List<BackupBookDTO> input = List.empty();

      // when
      final result = toBooks(input);

      // then
      expect(result.isEmpty, true);
    });
  });

  test('should convert all dtos to books', () {
    // given
    final bookDTOs = [
      fakeBackupBookDTO(),
      fakeBackupBookDTO(),
      fakeBackupBookDTO(),
    ];

    // when
    final result = toBooks(bookDTOs);

    // then
    expect(result[0], bookFromBackupDTO(bookDTOs[0]));
    expect(result[1], bookFromBackupDTO(bookDTOs[1]));
    expect(result[2], bookFromBackupDTO(bookDTOs[2]));
  });
}
