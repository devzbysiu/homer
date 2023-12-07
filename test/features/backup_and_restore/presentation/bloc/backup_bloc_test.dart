import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/load_backup.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/make_backup.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/replace_all_books.dart';
import 'package:homer/features/backup_and_restore/presentation/bloc/backup_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import 'backup_bloc_test.mocks.dart';

@GenerateMocks([LoadBackup, MakeBackup, ReplaceAllBooks])
void main() {
  group('_onRestoreTriggered', () {
    final backupPath = fakePath();

    blocTest<BackupBloc, BackupState>(
      'should emit RestoreInProgress and RestoredFinished on success',
      build: () => BackupBlocMock().allWorking(),
      act: (bloc) => bloc.add(RestoreTriggered(backupPath)),
      expect: () => [const RestoreInProgress(), RestoreFinished()],
    );

    blocTest<BackupBloc, BackupState>(
      'should emit RestoreInProgress and FailedToRestoreBooks on LoadBackup failure',
      build: () => BackupBlocMock().onLoadBackup(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(RestoreTriggered(backupPath)),
      expect: () => [const RestoreInProgress(), FailedToRestoreBooks()],
    );

    blocTest<BackupBloc, BackupState>(
      'should emit RestoreInProgress and FailedToRestoreBooks on ReplaceAllBooks failure',
      build: () =>
          BackupBlocMock().onReplaceAllBooks(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(RestoreTriggered(backupPath)),
      expect: () => [const RestoreInProgress(), FailedToRestoreBooks()],
    );
  });

  group('_onBackupTriggered', () {
    final backupPath = fakePath();

    blocTest<BackupBloc, BackupState>(
      'should emit BackupInProgress and BackupFinished on success',
      build: () => BackupBlocMock().allWorking(),
      act: (bloc) => bloc.add(BackupTriggered(backupPath)),
      expect: () => [const BackupInProgress(), BackupFinished()],
    );

    blocTest<BackupBloc, BackupState>(
      'should emit BackupInProgress and FailedToMakeBackup on failure',
      build: () => BackupBlocMock().onMakeBackup(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(BackupTriggered(backupPath)),
      expect: () => [const BackupInProgress(), FailedToMakeBackup()],
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

    when(_loadBackup.call(any))
        .thenAnswer((_) => Future.value(const Success([])));
    when(_replaceAllBooks.call(any))
        .thenAnswer((_) => Future.value(const Success(unit)));
    when(_makeBackup.call(any))
        .thenAnswer((_) => Future.value(const Success(unit)));
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
