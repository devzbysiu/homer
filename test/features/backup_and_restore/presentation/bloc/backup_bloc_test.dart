import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/core/orchestrator/bus.dart';
import 'package:homer/core/orchestrator/events.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/load_backup.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/make_backup.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/replace_all_books.dart';
import 'package:homer/features/backup_and_restore/presentation/bloc/backup_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('_onRestoreTriggered', () {
    final path = fakePath();
    final books = [fakeBook(), fakeBook(), fakeBook()];

    blocTest<BackupBloc, BackupState>(
      'should emit restoreInProgress and restoredFinished on success',
      build: () => BlocMock().onLoadBackup(Success(books)).get(),
      act: (bloc) => bloc.add(RestoreTriggered(path)),
      expect:
          () => [
            const BackupState(value: Value.restoreInProgress),
            const BackupState(value: Value.restoreFinished),
          ],
      verify: (bloc) {
        verify(bloc.loadBackup(RestoreParams(path: path)));
        verify(bloc.replaceAllBooks(ReplaceParams(books: books)));
        verify(bloc.eventBus.fire(RestoreFinished()));
      },
    );

    blocTest<BackupBloc, BackupState>(
      'should emit restoreInProgress and failedToRestoreBooks on LoadBackup failure',
      build: () => BlocMock().onLoadBackup(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(RestoreTriggered(path)),
      expect:
          () => [
            const BackupState(value: Value.restoreInProgress),
            const BackupState(value: Value.restoreFailed),
          ],
      verify: (bloc) => verify(bloc.loadBackup(RestoreParams(path: path))),
    );

    blocTest<BackupBloc, BackupState>(
      'should emit restoreInProgress and failedToRestoreBooks on ReplaceAllBooks failure',
      build: () => BlocMock().onReplaceAllBooks(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(RestoreTriggered(path)),
      expect:
          () => [
            const BackupState(value: Value.restoreInProgress),
            const BackupState(value: Value.restoreFailed),
          ],
      verify: (bloc) => verify(bloc.loadBackup(RestoreParams(path: path))),
    );
  });

  group('_onBackupTriggered', () {
    final backupPath = fakePath();

    blocTest<BackupBloc, BackupState>(
      'should emit backupInProgress and backupFinished on success',
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(BackupTriggered(backupPath)),
      expect:
          () => [
            const BackupState(value: Value.backupInProgress),
            const BackupState(value: Value.backupFinished),
          ],
      verify: (bloc) => verify(bloc.makeBackup(BackupParams(path: backupPath))),
    );

    blocTest<BackupBloc, BackupState>(
      'should emit backupInProgress and backupFailed on failure',
      build: () => BlocMock().onMakeBackup(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(BackupTriggered(backupPath)),
      expect:
          () => [
            const BackupState(value: Value.backupInProgress),
            const BackupState(value: Value.backupFailed),
          ],
      verify: (bloc) => verify(bloc.makeBackup(BackupParams(path: backupPath))),
    );
  });
}

final class BlocMock {
  BlocMock() {
    provideDummy<Result<List<Book>, Failure>>(const Success([]));
    provideDummy<Result<Unit, Failure>>(const Success(unit));

    _eventBus = MockBus();
    _loadBackup = MockLoadBackup();
    _makeBackup = MockMakeBackup();
    _replaceAllBooks = MockReplaceAllBooks();

    when(_loadBackup.call(any)).thenAnswer((_) => withSuccess([]));
    when(_replaceAllBooks.call(any)).thenAnswer((_) => withSuccess(unit));
    when(_makeBackup.call(any)).thenAnswer((_) => withSuccess(unit));
  }

  late final Bus _eventBus;

  late final MockLoadBackup _loadBackup;

  late final MockMakeBackup _makeBackup;

  late final MockReplaceAllBooks _replaceAllBooks;

  BlocMock onLoadBackup(Result<List<Book>, Failure> ret) {
    when(_loadBackup.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BlocMock onReplaceAllBooks(Result<Unit, Failure> ret) {
    when(_replaceAllBooks.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BlocMock onMakeBackup(Result<Unit, Failure> ret) {
    when(_makeBackup.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BackupBloc get() => _createMock();

  BackupBloc _createMock() {
    return BackupBloc(
      eventBus: _eventBus,
      loadBackup: _loadBackup,
      makeBackup: _makeBackup,
      replaceAllBooks: _replaceAllBooks,
    );
  }

  BackupBloc allWorking() => _createMock();
}
