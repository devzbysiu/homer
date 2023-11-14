import 'package:homer/core/mappers/restored_books_mapper.dart';
import 'package:homer/features/backup_and_restore/data/models/local_backup_book_dto.dart';
import 'package:homer/features/backup_and_restore/domain/entities/restored_book.dart';
import 'package:test/test.dart';

import '../../test_utils.dart';

void main() {
  group('toRestoredBooks', () {
    test('should return empty list when input is empty', () {
      // given
      final List<LocalBackupBookDTO> empty = List.empty();

      // when
      final result = toRestoredBooks(empty);

      // then
      expect(result.isEmpty, true);
    });

    test('should convert every DTO to RestoredBook', () {
      // given
      final input = [
        fakeLocalBackupBookDTO(),
        fakeLocalBackupBookDTO(),
      ];

      // when
      final result = toRestoredBooks(input);

      // then
      expect(result, [
        restoredBookFromDTO(input[0]),
        restoredBookFromDTO(input[1]),
      ]);
    });
  });

  group('toLocalBooks', () {
    test('should return empty list when input is empty list', () {
      // given
      final List<RestoredBook> input = List.empty();

      // when
      final result = toLocalBooks(input);

      // then
      expect(result.isEmpty, true);
    });

    test('should convert every RestoredBook to LocalBook', () {
      // given
      final input = [
        fakeRestoredBook(),
        fakeRestoredBook(),
      ];

      // when
      final result = toLocalBooks(input);

      // then
      expect(result, [
        localBookFromRestored(input[0]),
        localBookFromRestored(input[1]),
      ]);
    });
  });
}
