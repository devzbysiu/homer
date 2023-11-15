import 'package:homer/features/backup_and_restore/data/models/backup_book_dto.dart';
import 'package:test/test.dart';

import '../../../test_utils.dart';

void main() {
  group('fromJson', () {
    test('should construct DTO from json', () {
      // given
      final json = fakeBackupBookDTOJson();

      // when
      final result = BackupBookDTO.fromJson(json);

      // then
      expect(result, backupBookDTOFromJson(json));
    });
  });

  group('toJson', () {
    test('should produce valid json from DTO', () {
      // given
      final dto = fakeBackupBookDTO();

      // when
      final json = dto.toJson();

      // then
      expect(json, backupBookDTOToJson(dto));
    });
  });
}
