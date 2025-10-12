import 'package:homer/features/import_export/data/models/exported_book_dto.dart';
import 'package:test/test.dart';

import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/from_json_helpers.dart';
import '../../../../test_utils/to_json_helpers.dart';

void main() {
  group('fromJson', () {
    test('should construct book DTO from json', () {
      // given
      final json = fakeExportedBookDTOJson();

      // when
      final result = ExportedBookDTO.fromJson(json);

      // then
      expect(result, exportedBookDTOFromJson(json));
    });
  });

  group('toJson', () {
    test('should produce valid json from book DTO', () {
      // given
      final dto = fakeExportedBookDTO();

      // when
      final json = dto.toJson();

      // then
      expect(json, exportedBookDTOToJson(dto));
    });
  });
}
