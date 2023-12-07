import 'package:homer/features/find_new_book/data/mappers/to_remote_book_dto.dart';
import 'package:test/test.dart';

import '../../../../test_utils/assertion_helpers.dart';
import '../../../../test_utils/fakes.dart';

void main() {
  group('toRemoteBookDTO', () {
    test('should return valid external book dto', () {
      // given
      final book = fakeBookFinderBook();

      // when
      final result = toExternalBookDTO(book);

      // then
      expect(result, fromBookFinderBook(book));
    });
  });
}
