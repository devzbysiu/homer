import 'package:homer/features/import_export/data/models/exported_tag_dto.dart';
import 'package:test/test.dart';

import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/from_json_helpers.dart';
import '../../../../test_utils/to_json_helpers.dart';

void main() {
  group('fromJson', () {
    test('should construct tag DTO from json', () {
      // given
      final json = fakeExportedTagDTOJson();

      // when
      final result = ExportedTagDTO.fromJson(json);

      // then
      expect(result, exportedTagDTOFromJson(json));
    });
  });

  group('toJson', () {
    test('should produce valid json from tag DTO', () {
      // given
      final dto = fakeExportedTagDTO();

      // when
      final json = dto.toJson();

      // then
      expect(json, exportedTagDTOToJson(dto));
    });
  });
}
