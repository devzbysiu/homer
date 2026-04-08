import 'package:homer/features/settings/domain/usecases/save_settings.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('saveSettings', () {
    test('should use settings repo to save settings', () async {
      // given
      final settingsRepo = makeMockSettingsRepo();
      when(settingsRepo.save(any)).thenAnswer((_) => withSuccess(unit));
      final saveSettings = SaveSettingsImpl(settingsRepo);

      final settings = fakeSettings();

      verifyZeroInteractions(settingsRepo);

      // when
      final _ = await saveSettings(SettingsParams(settings: settings));

      // then
      verify(settingsRepo.save(settings));
      verifyNoMoreInteractions(settingsRepo);
    });

    test('should return failure when settings repo fails', () async {
      // given
      final settingsRepo = makeMockSettingsRepo();
      when(
        settingsRepo.save(any),
      ).thenAnswer((_) => withError(TestingFailure()));
      final saveSettings = SaveSettingsImpl(settingsRepo);

      final settings = fakeSettings();

      // when
      final result = await saveSettings(SettingsParams(settings: settings));

      // then
      expect(result.isError(), true);
    });

    test('should return success when settings repo works', () async {
      // given
      final settingsRepo = makeMockSettingsRepo();
      when(settingsRepo.save(any)).thenAnswer((_) => withSuccess(unit));
      final saveSettings = SaveSettingsImpl(settingsRepo);

      final settings = fakeSettings();

      // when
      final result = await saveSettings(SettingsParams(settings: settings));

      // then
      expect(result.isSuccess(), true);
    });
  });
}
