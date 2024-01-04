import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/presentation/bloc/backup_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('_onRestoreTriggered', () {
    final backupPath = fakePath();

    blocTest<BackupBloc, BackupState>(
      'should emit restoreInProgress and restoredFinished on success',
      build: () => BackupBlocMock().allWorking(),
      act: (bloc) => bloc.add(RestoreTriggered(backupPath)),
      expect: () => [
        const BackupState.restoreInProgress(),
        const BackupState.restoreFinished(),
      ],
    );

    blocTest<BackupBloc, BackupState>(
      'should emit restoreInProgress and failedToRestoreBooks on LoadBackup failure',
      build: () => BackupBlocMock().onLoadBackup(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(RestoreTriggered(backupPath)),
      expect: () => [
        const BackupState.restoreInProgress(),
        const BackupState.restoreFailed(),
      ],
    );

    blocTest<BackupBloc, BackupState>(
      'should emit restoreInProgress and failedToRestoreBooks on ReplaceAllBooks failure',
      build: () =>
          BackupBlocMock().onReplaceAllBooks(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(RestoreTriggered(backupPath)),
      expect: () => [
        const BackupState.restoreInProgress(),
        const BackupState.restoreFailed(),
      ],
    );
  });

  group('_onBackupTriggered', () {
    final backupPath = fakePath();

    blocTest<BackupBloc, BackupState>(
      'should emit backupInProgress and backupFinished on success',
      build: () => BackupBlocMock().allWorking(),
      act: (bloc) => bloc.add(BackupTriggered(backupPath)),
      expect: () => [
        const BackupState.backupInProgress(),
        const BackupState.backupFinished(),
      ],
    );

    blocTest<BackupBloc, BackupState>(
      'should emit backupInProgress and failedToMakeBackup on failure',
      build: () => BackupBlocMock().onMakeBackup(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(BackupTriggered(backupPath)),
      expect: () => [
        const BackupState.backupInProgress(),
        const BackupState.backupFailed(),
      ],
    );
  });
}

final class BackupBlocMock {
  BackupBlocMock() {
    provideDummy<Result<List<Book>, Failure>>(const Success([]));
    provideDummy<Result<Unit, Failure>>(const Success(unit));

    _loadBackup = MockLoadBackup();
    _makeBackup = MockMakeBackup();
    _replaceAllBooks = MockReplaceAllBooks();

    when(_loadBackup.call(any)).thenAnswer((_) => withSuccess([]));
    when(_replaceAllBooks.call(any)).thenAnswer((_) => withSuccess(unit));
    when(_makeBackup.call(any)).thenAnswer((_) => withSuccess(unit));
  }

  late final MockLoadBackup _loadBackup;

  late final MockMakeBackup _makeBackup;

  late final MockReplaceAllBooks _replaceAllBooks;

  BackupBlocMock onLoadBackup(Result<List<Book>, Failure> ret) {
    when(_loadBackup.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BackupBlocMock onReplaceAllBooks(Result<Unit, Failure> ret) {
    when(_replaceAllBooks.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BackupBlocMock onMakeBackup(Result<Unit, Failure> ret) {
    when(_makeBackup.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BackupBloc get() {
    return _createMock();
  }

  BackupBloc _createMock() {
    return BackupBloc(
      loadBackup: _loadBackup,
      makeBackup: _makeBackup,
      replaceAllBooks: _replaceAllBooks,
    );
  }

  BackupBloc allWorking() {
    return _createMock();
  }
}
