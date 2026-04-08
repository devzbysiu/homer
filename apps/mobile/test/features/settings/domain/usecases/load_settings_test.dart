import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/settings/domain/usecases/load_settings.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('loadSettings', () {
    test('should use settings repo to read settings', () async {
      // given
      final settingsRepo = makeMockSettingsRepo();
      when(settingsRepo.load()).thenAnswer((_) => withSuccess(fakeSettings()));
      final loadSettings = LoadSettingsImpl(settingsRepo);

      verifyZeroInteractions(settingsRepo);

      // when
      final _ = await loadSettings(NoParams());

      // then
      verify(settingsRepo.load());
      verifyNoMoreInteractions(settingsRepo);
    });

    test('should return failure when settings repo fails', () async {
      // given
      final settingsRepo = makeMockSettingsRepo();
      when(settingsRepo.load()).thenAnswer((_) => withError(TestingFailure()));
      final loadSettings = LoadSettingsImpl(settingsRepo);

      // when
      final result = await loadSettings(NoParams());

      // then
      expect(result.isError(), true);
    });

    test('should return success when settings repo works', () async {
      // given
      final settingsRepo = makeMockSettingsRepo();
      final settings = fakeSettings();
      when(settingsRepo.load()).thenAnswer((_) => withSuccess(settings));
      final loadSettings = LoadSettingsImpl(settingsRepo);

      // when
      final result = await loadSettings(NoParams());

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, settings);
    });
  });
}
