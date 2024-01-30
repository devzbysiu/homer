import 'package:homer/core/error/exceptions.dart';
import 'package:homer/features/settings/data/repositories/settings_repo.dart';
import 'package:homer/features/settings/domain/entities/settings.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../test_utils/assertion_helpers.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('save', () {
    test('should return success', () async {
      // given
      final settingsDataSource = makeMockSettingsDataSource();
      when(settingsDataSource.save(any)).thenAnswer((_) => withUnit());
      final repo = SettingsRepo(dataSource: settingsDataSource);

      final settings = fakeSettings();

      // when
      final result = await repo.save(settings);

      // then
      expect(result.isSuccess(), true);
    });

    test('should use settings data source to save settings', () async {
      // given
      final settingsDataSource = makeMockSettingsDataSource();
      final settingsDTO = fakeSettingsDTO();
      when(settingsDataSource.save(settingsDTO)).thenAnswer((_) => withUnit());
      final repo = SettingsRepo(dataSource: settingsDataSource);

      final settings = settingsFromSettingsDTO(settingsDTO);

      verifyZeroInteractions(settingsDataSource);

      // when
      final _ = await repo.save(settings);

      // then
      verify(settingsDataSource.save(settingsDTO));
      verifyNoMoreInteractions(settingsDataSource);
    });
  });

  group('load', () {
    test('should return success with default settings when datasource throws',
        () async {
      // given
      final settingsDataSource = makeMockSettingsDataSource();
      when(settingsDataSource.load()).thenThrow(NoSettingsException());
      final repo = SettingsRepo(dataSource: settingsDataSource);

      // when
      final result = await repo.load();

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, Settings.makeDefault());
    });

    test('should return success with settings when datasource works', () async {
      // given
      final settingsDTO = fakeSettingsDTO();
      final settingsDataSource = makeMockSettingsDataSource();
      when(settingsDataSource.load()).thenAnswer((_) => withIt(settingsDTO));
      final repo = SettingsRepo(dataSource: settingsDataSource);

      // when
      final result = await repo.load();

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, settingsFromSettingsDTO(settingsDTO));
    });

    test('should use settings data source to load settings', () async {
      // given
      final settingsDataSource = makeMockSettingsDataSource();
      final settingsDTO = fakeSettingsDTO();
      when(settingsDataSource.load()).thenAnswer((_) => withIt(settingsDTO));
      final repo = SettingsRepo(dataSource: settingsDataSource);

      verifyZeroInteractions(settingsDataSource);

      // when
      final _ = await repo.load();

      // then
      verify(settingsDataSource.load());
      verifyNoMoreInteractions(settingsDataSource);
    });
  });
}
