import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart';
import 'package:test/test.dart';

import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/from_json_helpers.dart';
import '../../../../test_utils/to_json_helpers.dart';

void main() {
  group('fromJson', () {
    test('should construct external book info DTO from json', () {
      // given
      final json = fakeExternalBookInfoDTOJson();

      // when
      final result = ExternalBookInfoDTO.fromJson(json);

      // then
      expect(result, externalBookInfoDTOFromJson(json));
    });
  });

  group('toJson', () {
    test('should produce valid json from external book info DTO', () {
      // given
      final dto = fakeExternalBookInfoDTO();

      // when
      final json = dto.toJson();

      // then
      expect(json, externalBookInfoDTOToJson(dto));
    });
  });
}
