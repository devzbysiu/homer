import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/settings/domain/entities/book_size_limits.dart';
import 'package:homer/features/settings/domain/entities/settings.dart';
import 'package:homer/features/settings/domain/usecases/save_settings.dart';
import 'package:homer/features/settings/presentation/bloc/settings_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('_onSettingsLoaded', () {
    final settings = fakeSettings();

    blocTest<SettingsBloc, SettingsState>(
      'should emit SettingsState with loaded settings',
      build: () => BlocMock().onLoadSettings(Success(settings)).get(),
      act: (bloc) => bloc.add(SettingsLoaded()),
      expect: () => [
        SettingsState(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        )
      ],
      verify: (bloc) => verify(bloc.loadSettings(NoParams())),
    );

    blocTest<SettingsBloc, SettingsState>(
      'should emit FailedToLoadSettings when loading failed',
      build: () => BlocMock().onLoadSettings(Error(TestingFailure())).get(),
      act: (bloc) => {/* do nothing */},
      expect: () => [FailedToLoadSettings()],
      verify: (bloc) => verify(bloc.loadSettings(NoParams())),
    );
  });

  group('_onThemeToggled', () {
    final settings = fakeSettings();

    blocTest<SettingsBloc, SettingsState>(
      'should emit SettingsState with toggled theme setting',
      build: () => BlocMock().onLoadSettings(Success(settings)).get(),
      act: (bloc) => bloc.add(ThemeToggled()),
      expect: () => [
        SettingsState(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
        SettingsState(
          isDarkThemeOn: !settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        )
      ],
      verify: (bloc) => verify(bloc.saveSettings(SettingsParams(
        settings: Settings(
          isDarkThemeOn: !settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
      ))),
    );

    blocTest<SettingsBloc, SettingsState>(
      'should emit FailedToSaveSettings when saving fails',
      build: () => BlocMock()
          .onLoadSettings(Success(settings))
          .onSaveSettings(Error(TestingFailure()))
          .get(),
      act: (bloc) => bloc.add(ThemeToggled()),
      expect: () => [
        SettingsState(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
        FailedToSaveSettings(),
      ],
      verify: (bloc) => verify(bloc.saveSettings(SettingsParams(
        settings: Settings(
          isDarkThemeOn: !settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
      ))),
    );
  });

  group('_onSystemThemeToggled', () {
    final settings = fakeSettings();

    blocTest<SettingsBloc, SettingsState>(
      'should emit SettingsState with toggled system theme setting',
      build: () => BlocMock().onLoadSettings(Success(settings)).get(),
      act: (bloc) => bloc.add(SystemThemeToggled()),
      expect: () => [
        SettingsState(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
        SettingsState(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: !settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        )
      ],
      verify: (bloc) => verify(bloc.saveSettings(SettingsParams(
        settings: Settings(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: !settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
      ))),
    );

    blocTest<SettingsBloc, SettingsState>(
      'should emit FailedToSaveSettings when saving fails',
      build: () => BlocMock()
          .onLoadSettings(Success(settings))
          .onSaveSettings(Error(TestingFailure()))
          .get(),
      act: (bloc) => bloc.add(SystemThemeToggled()),
      expect: () => [
        SettingsState(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
        FailedToSaveSettings(),
      ],
      verify: (bloc) => verify(bloc.saveSettings(SettingsParams(
        settings: Settings(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: !settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
      ))),
    );
  });

  group('_onBackupPathSelected', () {
    final settings = fakeSettings();
    final directory = Directory(fakePath());

    blocTest<SettingsBloc, SettingsState>(
      'should emit SettingsState with changed backup path setting',
      build: () => BlocMock().onLoadSettings(Success(settings)).get(),
      act: (bloc) => bloc.add(BackupsDirectorySelected(directory)),
      expect: () => [
        SettingsState(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
        SettingsState(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: directory,
          bookSizeLimits: settings.bookSizeLimits,
        )
      ],
      verify: (bloc) => verify(bloc.saveSettings(SettingsParams(
        settings: Settings(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: directory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
      ))),
    );

    blocTest<SettingsBloc, SettingsState>(
      'should emit FailedToSaveSettings when saving fails',
      build: () => BlocMock()
          .onLoadSettings(Success(settings))
          .onSaveSettings(Error(TestingFailure()))
          .get(),
      act: (bloc) => bloc.add(BackupsDirectorySelected(directory)),
      expect: () => [
        SettingsState(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
        FailedToSaveSettings(),
      ],
      verify: (bloc) => verify(bloc.saveSettings(SettingsParams(
        settings: Settings(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: directory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
      ))),
    );
  });

  group('_onBookSizeLimitsChanged', () {
    final settings = fakeSettings();
    final limits = BookSizeLimits(shortMax: 100, mediumMax: 200);

    blocTest<SettingsBloc, SettingsState>(
      'should emit SettingsState with changed book size limits',
      build: () => BlocMock().onLoadSettings(Success(settings)).get(),
      act: (bloc) => bloc.add(BookSizeLimitsChanged(limits)),
      expect: () => [
        SettingsState(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
        SettingsState(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: limits,
        )
      ],
      verify: (bloc) => verify(bloc.saveSettings(SettingsParams(
        settings: Settings(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: limits,
        ),
      ))),
    );

    blocTest<SettingsBloc, SettingsState>(
      'should emit FailedToSaveSettings when saving fails',
      build: () => BlocMock()
          .onLoadSettings(Success(settings))
          .onSaveSettings(Error(TestingFailure()))
          .get(),
      act: (bloc) => bloc.add(BookSizeLimitsChanged(limits)),
      expect: () => [
        SettingsState(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: settings.bookSizeLimits,
        ),
        FailedToSaveSettings(),
      ],
      verify: (bloc) => verify(bloc.saveSettings(SettingsParams(
        settings: Settings(
          isDarkThemeOn: settings.isDarkThemeOn,
          isSystemThemeOn: settings.isSystemThemeOn,
          backupsDirectory: settings.backupsDirectory,
          bookSizeLimits: limits,
        ),
      ))),
    );
  });
}

final class BlocMock {
  BlocMock() {
    provideDummy<Result<Unit, Failure>>(const Success(unit));
    provideDummy<Result<Settings, Failure>>(Success(fakeSettings()));

    _saveSettings = MockSaveSettings();
    _loadSettings = MockLoadSettings();

    when(_saveSettings.call(any)).thenAnswer((_) => withSuccess(unit));
    when(_loadSettings.call(any))
        .thenAnswer((_) => withSuccess(fakeSettings()));
  }

  late final MockSaveSettings _saveSettings;

  late final MockLoadSettings _loadSettings;

  BlocMock onSaveSettings(Result<Unit, Failure> ret) {
    when(_saveSettings.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BlocMock onLoadSettings(Result<Settings, Failure> ret) {
    when(_loadSettings.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  SettingsBloc get() => _createMock();

  SettingsBloc _createMock() {
    return SettingsBloc(
      saveSettings: _saveSettings,
      loadSettings: _loadSettings,
    );
  }

  SettingsBloc allWorking() => _createMock();
}
