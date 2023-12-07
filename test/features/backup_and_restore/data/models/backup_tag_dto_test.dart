import 'package:homer/features/backup_and_restore/data/models/backup_tag_dto.dart';
import 'package:test/test.dart';

import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/from_json_helpers.dart';
import '../../../../test_utils/to_json_helpers.dart';

void main() {
  group('fromJson', () {
    test('should construct tag DTO from json', () {
      // given
      final json = fakeBackupTagDTOJson();

      // when
      final result = BackupTagDTO.fromJson(json);

      // then
      expect(result, backupTagDTOFromJson(json));
    });
  });

  group('toJson', () {
    test('should produce valid json from tag DTO', () {
      // given
      final dto = fakeBackupTagDTO();

      // when
      final json = dto.toJson();

      // then
      expect(json, backupTagDTOToJson(dto));
    });
  });
}
