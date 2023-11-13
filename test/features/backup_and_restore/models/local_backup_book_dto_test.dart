import 'package:homer/features/backup_and_restore/data/models/local_backup_book_dto.dart';
import 'package:test/test.dart';

import '../../../test_utils.dart';

void main() {
  group('fromJson', () {
    test('should construct DTO from json', () {
      // given
      final json = fakeLocalBackupBookDTOJson();

      // when
      final result = LocalBackupBookDTO.fromJson(json);

      // then
      expect(result, localBackupBookDTOFromJson(json));
    });
  });

  group('toJson', () {
    test('should produce valid json from DTO', () {
      // given
      final dto = fakeLocalBackupBookDTO();

      // when
      final json = dto.toJson();

      // then
      expect(json, localBackupBookDTOToJson(dto));
    });
  });
}
