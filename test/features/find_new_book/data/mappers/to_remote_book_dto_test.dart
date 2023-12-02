import 'package:homer/features/find_new_book/data/mappers/to_remote_book_dto.dart';
import 'package:test/test.dart';

import '../../../../test_utils.dart';

void main() {
  group('toRemoteBookDTO', () {
    test('should return valid remote book dto', () {
      // given
      final book = fakeBookFinderBook();

      // when
      final result = toRemoteBookDTO(book);

      // then
      expect(result, fromBookFinderBook(book));
    });
  });
}
