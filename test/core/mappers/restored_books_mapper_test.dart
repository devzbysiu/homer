import 'package:homer/core/mappers/restored_books_mapper.dart';
import 'package:homer/features/backup_and_restore/domain/entities/restored_book.dart';
import 'package:test/test.dart';

import '../../test_utils.dart';

void main() {
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
      final List<RestoredBook> input = [
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
