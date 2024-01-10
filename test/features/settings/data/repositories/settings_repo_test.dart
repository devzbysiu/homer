import 'package:homer/core/error/exceptions.dart';
import 'package:homer/features/settings/data/models/settings_dto.dart';
import 'package:homer/features/settings/data/repositories/settings_repo.dart';
import 'package:homer/features/settings/domain/entities/settings.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils/assertion_helpers.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('save', () {
    test('should return success', () async {
      // given
      final settingsDataSource = makeMockSettingsDatasource();
      when(settingsDataSource.save(any)).thenAnswer((_) => withUnit());
      final repo = SettingsRepo(settingsDataSource: settingsDataSource);

      final settings = fakeSettings();

      // when
      final result = await repo.save(settings);

      // then
      expect(result.isSuccess(), true);
    });

    test('should use settings data source to save settings', () async {
      // given
      final settingsDataSource = makeMockSettingsDatasource();
      final settingsDTO = fakeSettingsDTO();
      when(settingsDataSource.save(settingsDTO)).thenAnswer((_) => withUnit());
      final repo = SettingsRepo(settingsDataSource: settingsDataSource);

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
      final settingsDataSource = makeMockSettingsDatasource();
      when(settingsDataSource.load()).thenThrow(NoSettingsException());
      final repo = SettingsRepo(settingsDataSource: settingsDataSource);

      // when
      final result = await repo.load();

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, Settings.makeDefault());
    });

    test('should return success with settings when datasource works', () async {
      // given
      final settingsDTO = fakeSettingsDTO();
      final settingsDataSource = makeMockSettingsDatasource();
      when(settingsDataSource.load()).thenAnswer((_) => withIt(settingsDTO));
      final repo = SettingsRepo(settingsDataSource: settingsDataSource);

      // when
      final result = await repo.load();

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, settingsFromSettingsDTO(settingsDTO));
    });

    test('should use settings data source to load settings', () async {
      // given
      final settingsDataSource = makeMockSettingsDatasource();
      final settingsDTO = fakeSettingsDTO();
      when(settingsDataSource.load()).thenAnswer((_) => withIt(settingsDTO));
      final repo = SettingsRepo(settingsDataSource: settingsDataSource);

      verifyZeroInteractions(settingsDataSource);

      // when
      final _ = await repo.load();

      // then
      verify(settingsDataSource.load());
      verifyNoMoreInteractions(settingsDataSource);
    });
  });
}

MockSettingsDataSource makeMockSettingsDatasource() {
  final mock = MockSettingsDataSource();
  provideDummy<Unit>(unit);
  provideDummy<SettingsDTO>(fakeSettingsDTO());
  return mock;
}
