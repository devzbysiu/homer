import 'package:homer/features/settings/data/models/settings_dto.dart';
import 'package:test/test.dart';

import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/from_json_helpers.dart';
import '../../../../test_utils/to_json_helpers.dart';

void main() {
  group('fromJson', () {
    test('should construct settings DTO from json', () {
      // given
      final json = fakeSettingsDTOJson();

      // when
      final result = SettingsDTO.fromJson(json);

      // then
      expect(result, settingsDTOFromJson(json));
    });
  });

  group('toJson', () {
    test('should produce valid json from settings DTO', () {
      // given
      final dto = fakeSettingsDTO();

      // when
      final json = dto.toJson();

      // then
      expect(json, settingsDTOToJson(dto));
    });
  });
}
