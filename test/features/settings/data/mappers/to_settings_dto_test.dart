import 'package:homer/features/settings/data/mappers/to_settings_dto.dart';
import 'package:test/test.dart';

import '../../../../test_utils/assertion_helpers.dart';
import '../../../../test_utils/fakes.dart';

void main() {
  group('toSettingsDTO', () {
    test('should return valid settings dto', () {
      // given
      final settings = fakeSettings();

      // when
      final result = toSettingsDTO(settings);

      // then
      expect(result, settingsDTOFromSettings(settings));
    });
  });
}
