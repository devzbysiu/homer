import 'package:homer/features/settings/data/mappers/to_settings.dart';
import 'package:test/test.dart';

import '../../../../test_utils/assertion_helpers.dart';
import '../../../../test_utils/fakes.dart';

void main() {
  group('toSettings', () {
    test('should return valid settings', () {
      // given
      final settingsDTO = fakeSettingsDTO();

      // when
      final result = toSettings(
        isDarkThemeOn: settingsDTO.isDarkThemeOn,
        isSystemThemeOn: settingsDTO.isSystemThemeOn,
        backupsDirectory: settingsDTO.backupsDirectory,
        bookSizeLimits: settingsDTO.bookSizeLimits,
      );

      // then
      expect(result, settingsFromSettingsDTO(settingsDTO));
    });
  });
}
