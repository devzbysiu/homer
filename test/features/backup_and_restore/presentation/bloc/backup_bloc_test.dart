import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/add_all_books.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/load_backup.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/make_backup.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/purge_repo.dart';
import 'package:homer/features/backup_and_restore/presentation/bloc/backup_bloc.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../test_utils.dart';
import 'backup_bloc_test.mocks.dart';

@GenerateMocks([LoadBackup, MakeBackup, AddAllBooks, PurgeRepo])
void main() {
  group('_onRestoreTriggered', () {
    final backupPath = fakePath();

    blocTest<BackupBloc, BackupState>(
      'should emit RestoreInProgress and RestoredFinished on success',
      build: () => BackupBlocMock().get(),
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
      'should emit RestoreInProgress and FailedToRestoreBooks on PurgeRepo failure',
      build: () => BackupBlocMock().onPurgeRepo(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(RestoreTriggered(backupPath)),
      expect: () => [const RestoreInProgress(), FailedToRestoreBooks()],
    );

    blocTest<BackupBloc, BackupState>(
      'should emit RestoreInProgress and FailedToRestoreBooks on AddAllBooks failure',
      build: () =>
          BackupBlocMock().onAddAllBooks(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(RestoreTriggered(backupPath)),
      expect: () => [const RestoreInProgress(), FailedToRestoreBooks()],
    );
  });
}

final class BackupBlocMock {
  BackupBlocMock() {
    provideDummy<Result<List<Book>, Failure>>(const Success([]));
    provideDummy<Result<Unit, Failure>>(const Success(unit));

    _loadBackup = MockLoadBackup();
    _makeBackup = MockMakeBackup();
    _addAllBooks = MockAddAllBooks();
    _purgeRepo = MockPurgeRepo();

    when(_loadBackup.call(any))
        .thenAnswer((_) => Future.value(const Success([])));
    when(_purgeRepo.call(any))
        .thenAnswer((_) => Future.value(const Success(unit)));
    when(_addAllBooks.call(any))
        .thenAnswer((_) => Future.value(const Success(unit)));
  }

  late final MockLoadBackup _loadBackup;

  late final MockMakeBackup _makeBackup;

  late final MockAddAllBooks _addAllBooks;

  late final MockPurgeRepo _purgeRepo;

  BackupBlocMock onLoadBackup(Result<List<Book>, Failure> ret) {
    when(_loadBackup.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BackupBlocMock onPurgeRepo(Result<Unit, Failure> ret) {
    when(_purgeRepo.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BackupBlocMock onAddAllBooks(Result<Unit, Failure> ret) {
    when(_addAllBooks.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BackupBloc get() {
    return BackupBloc(
      loadBackup: _loadBackup,
      makeBackup: _makeBackup,
      addAllBooks: _addAllBooks,
      purgeRepo: _purgeRepo,
    );
  }
}
