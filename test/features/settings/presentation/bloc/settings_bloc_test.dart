import 'dart:io';

import 'package:bloc_test/bloc_test.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/settings/domain/entities/book_size_limits.dart';
import 'package:homer/features/settings/domain/entities/reading_goal.dart';
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
      expect: () => [SettingsState(settings: _from(settings))],
      verify: (bloc) => verify(bloc.loadSettings(NoParams())),
    );

    blocTest<SettingsBloc, SettingsState>(
      'should emit default settings when loading failed',
      build: () => BlocMock().onLoadSettings(Error(TestingFailure())).get(),
      act: (bloc) => {/* do nothing */},
      expect: () => [SettingsState(settings: _defaultSettings())],
      verify: (bloc) => verify(bloc.loadSettings(NoParams())),
    );
  });

  group('_onThemeToggled', () {
    final settings = fakeSettings();

    blocTest<SettingsBloc, SettingsState>(
      'should emit SettingsState with toggled dark theme setting',
      build: () => BlocMock().onLoadSettings(Success(settings)).get(),
      act: (bloc) => bloc.add(ThemeToggled()),
      expect:
          () => [
            SettingsState(settings: _from(settings)),
            SettingsState(
              settings: Settings(
                useSystemTheme: settings.useSystemTheme,
                useDarkTheme: !settings.useDarkTheme,
                backupsDir: settings.backupsDir,
                bookSizeLimits: settings.bookSizeLimits,
                readingGoal: settings.readingGoal,
              ),
            ),
          ],
      verify:
          (bloc) => verify(
            bloc.saveSettings(
              SettingsParams(settings: settings.toggleDarkTheme()),
            ),
          ),
    );

    blocTest<SettingsBloc, SettingsState>(
      'should emit default settings when saving fails',
      build:
          () =>
              BlocMock()
                  .onLoadSettings(Success(settings))
                  .onSaveSettings(Error(TestingFailure()))
                  .get(),
      act: (bloc) => bloc.add(ThemeToggled()),
      expect:
          () => [
            SettingsState(settings: _from(settings)),
            SettingsState(settings: _defaultSettings()),
          ],
      verify:
          (bloc) => verify(
            bloc.saveSettings(
              SettingsParams(settings: settings.toggleDarkTheme()),
            ),
          ),
    );
  });

  group('_onSystemThemeToggled', () {
    final settings = fakeSettings();

    blocTest<SettingsBloc, SettingsState>(
      'should emit SettingsState with toggled system theme setting',
      build: () => BlocMock().onLoadSettings(Success(settings)).get(),
      act: (bloc) => bloc.add(SystemThemeToggled()),
      expect:
          () => [
            SettingsState(settings: _from(settings)),
            SettingsState(
              settings: Settings(
                useSystemTheme: !settings.useSystemTheme,
                useDarkTheme: settings.useDarkTheme,
                backupsDir: settings.backupsDir,
                bookSizeLimits: settings.bookSizeLimits,
                readingGoal: settings.readingGoal,
              ),
            ),
          ],
      verify:
          (bloc) => verify(
            bloc.saveSettings(
              SettingsParams(settings: settings.toggleSystemTheme()),
            ),
          ),
    );

    blocTest<SettingsBloc, SettingsState>(
      'should emit default settings when saving fails',
      build:
          () =>
              BlocMock()
                  .onLoadSettings(Success(settings))
                  .onSaveSettings(Error(TestingFailure()))
                  .get(),
      act: (bloc) => bloc.add(SystemThemeToggled()),
      expect:
          () => [
            SettingsState(settings: _from(settings)),
            SettingsState(settings: _defaultSettings()),
          ],
      verify:
          (bloc) => verify(
            bloc.saveSettings(
              SettingsParams(settings: settings.toggleSystemTheme()),
            ),
          ),
    );
  });

  group('_onBackupPathSelected', () {
    final settings = fakeSettings();
    final directory = Directory(fakePath());

    blocTest<SettingsBloc, SettingsState>(
      'should emit SettingsState with changed backup path setting',
      build: () => BlocMock().onLoadSettings(Success(settings)).get(),
      act: (bloc) => bloc.add(BackupsDirPicked(directory)),
      expect:
          () => [
            SettingsState(settings: _from(settings)),
            SettingsState(
              settings: Settings(
                useSystemTheme: settings.useSystemTheme,
                useDarkTheme: settings.useDarkTheme,
                backupsDir: directory,
                bookSizeLimits: settings.bookSizeLimits,
                readingGoal: settings.readingGoal,
              ),
            ),
          ],
      verify:
          (bloc) => verify(
            bloc.saveSettings(
              SettingsParams(settings: settings.changeBackupDir(directory)),
            ),
          ),
    );

    blocTest<SettingsBloc, SettingsState>(
      'should emit FailedToSaveSettings when saving fails',
      build:
          () =>
              BlocMock()
                  .onLoadSettings(Success(settings))
                  .onSaveSettings(Error(TestingFailure()))
                  .get(),
      act: (bloc) => bloc.add(BackupsDirPicked(directory)),
      expect:
          () => [
            SettingsState(settings: _from(settings)),
            SettingsState(settings: _defaultSettings()),
          ],
      verify:
          (bloc) => verify(
            bloc.saveSettings(
              SettingsParams(settings: settings.changeBackupDir(directory)),
            ),
          ),
    );
  });

  group('_onBookSizeLimitsChanged', () {
    final settings = fakeSettings();
    final limits = BookSizeLimits(shortMax: 100, mediumMax: 200);

    blocTest<SettingsBloc, SettingsState>(
      'should emit SettingsState with changed book size limits',
      build: () => BlocMock().onLoadSettings(Success(settings)).get(),
      act: (bloc) => bloc.add(SizeLimitsChanged(limits)),
      expect:
          () => [
            SettingsState(settings: _from(settings)),
            SettingsState(
              settings: Settings(
                useSystemTheme: settings.useSystemTheme,
                useDarkTheme: settings.useDarkTheme,
                backupsDir: settings.backupsDir,
                bookSizeLimits: limits,
                readingGoal: settings.readingGoal,
              ),
            ),
          ],
      verify:
          (bloc) => verify(
            bloc.saveSettings(
              SettingsParams(settings: settings.changeSizeLimits(limits)),
            ),
          ),
    );

    blocTest<SettingsBloc, SettingsState>(
      'should emit FailedToSaveSettings when saving fails',
      build:
          () =>
              BlocMock()
                  .onLoadSettings(Success(settings))
                  .onSaveSettings(Error(TestingFailure()))
                  .get(),
      act: (bloc) => bloc.add(SizeLimitsChanged(limits)),
      expect:
          () => [
            SettingsState(settings: _from(settings)),
            SettingsState(settings: _defaultSettings()),
          ],
      verify:
          (bloc) => verify(
            bloc.saveSettings(
              SettingsParams(settings: settings.changeSizeLimits(limits)),
            ),
          ),
    );
  });

  group('_onReadingGoalChanged', () {
    final settings = fakeSettings();

    blocTest<SettingsBloc, SettingsState>(
      'should emit SettingsState with changed reading goal',
      build: () => BlocMock().onLoadSettings(Success(settings)).get(),
      act: (bloc) => bloc.add(ReadingGoalChanged(const ReadingGoal(books: 16))),
      expect:
          () => [
            SettingsState(settings: _from(settings)),
            SettingsState(
              settings: Settings(
                useSystemTheme: settings.useSystemTheme,
                useDarkTheme: settings.useDarkTheme,
                backupsDir: settings.backupsDir,
                bookSizeLimits: settings.bookSizeLimits,
                readingGoal: const ReadingGoal(books: 16),
              ),
            ),
          ],
      verify:
          (bloc) => verify(
            bloc.saveSettings(
              SettingsParams(
                settings: settings.changeReadingGoal(
                  const ReadingGoal(books: 16),
                ),
              ),
            ),
          ),
    );

    blocTest<SettingsBloc, SettingsState>(
      'should emit default settings when saving fails',
      build:
          () =>
              BlocMock()
                  .onLoadSettings(Success(settings))
                  .onSaveSettings(Error(TestingFailure()))
                  .get(),
      act: (bloc) => bloc.add(ReadingGoalChanged(const ReadingGoal(books: 6))),
      expect:
          () => [
            SettingsState(settings: _from(settings)),
            SettingsState(settings: _defaultSettings()),
          ],
      verify:
          (bloc) => verify(
            bloc.saveSettings(
              SettingsParams(
                settings: settings.changeReadingGoal(
                  const ReadingGoal(books: 6),
                ),
              ),
            ),
          ),
    );
  });
}

Settings _from(Settings settings) {
  return Settings(
    useSystemTheme: settings.useSystemTheme,
    useDarkTheme: settings.useDarkTheme,
    backupsDir: settings.backupsDir,
    bookSizeLimits: settings.bookSizeLimits,
    readingGoal: settings.readingGoal,
  );
}

Settings _defaultSettings() {
  return Settings(
    useSystemTheme: true,
    useDarkTheme: true,
    backupsDir: Directory('/storage/emulated/0/Documents'),
    bookSizeLimits: BookSizeLimits(shortMax: 300, mediumMax: 500),
    readingGoal: const ReadingGoal(books: 0),
  );
}

final class BlocMock {
  BlocMock() {
    provideDummy<Result<Unit, Failure>>(const Success(unit));
    provideDummy<Result<Settings, Failure>>(Success(fakeSettings()));

    _saveSettings = MockSaveSettings();
    _loadSettings = MockLoadSettings();

    when(_saveSettings.call(any)).thenAnswer((_) => withSuccess(unit));
    when(
      _loadSettings.call(any),
    ).thenAnswer((_) => withSuccess(fakeSettings()));
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

  SettingsBloc get() {
    return SettingsBloc(
      saveSettings: _saveSettings,
      loadSettings: _loadSettings,
    );
  }
}
