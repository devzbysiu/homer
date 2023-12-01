import 'package:homer/core/entities/book.dart';
import 'package:homer/features/backup_and_restore/data/mappers/to_backup_book_dtos.dart';
import 'package:test/test.dart';

import '../../../../test_utils.dart';

void main() {
  group('toBackupBookDTOs', () {
    test('should return empty list when empty list on input', () {
      // given
      final List<Book> input = List.empty();

      // when
      final result = toBackupBookDTOs(input);

      // then
      expect(result.isEmpty, true);
    });
  });

  test('should convert all books to backup dto', () {
    // given
    final books = [fakeBook(), fakeBook(), fakeBook()];

    // when
    final result = toBackupBookDTOs(books);

    // then
    expect(result[0], backupDTOFromBook(books[0]));
    expect(result[1], backupDTOFromBook(books[1]));
    expect(result[2], backupDTOFromBook(books[2]));
  });
}
