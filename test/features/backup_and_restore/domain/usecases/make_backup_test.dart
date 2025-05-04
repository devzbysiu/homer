import 'package:homer/features/backup_and_restore/domain/usecases/make_backup.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('makeBackup', () {
    test('should use books repo to load all books', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess([]));

      final backupRepo = makeMockBackupRepo();
      when(backupRepo.saveAll(any, any)).thenAnswer((_) => withSuccess(unit));

      final makeBackup = MakeBackupImpl(backupRepo, booksRepo);

      verifyZeroInteractions(booksRepo);

      // when
      final _ = await makeBackup(BackupParams(path: fakePath()));

      // then
      verify(booksRepo.listAll());
      verifyNoMoreInteractions(booksRepo);
    });

    test('should use backup repo to save all books', () async {
      // given
      final books = [fakeBook()];
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));

      final backupRepo = makeMockBackupRepo();
      when(backupRepo.saveAll(any, any)).thenAnswer((_) => withSuccess(unit));
      final makeBackup = MakeBackupImpl(backupRepo, booksRepo);

      final backupPath = fakePath();

      verifyZeroInteractions(backupRepo);

      // when
      final _ = await makeBackup(BackupParams(path: backupPath));

      // then
      verify(backupRepo.saveAll(backupPath, books));
      verifyNoMoreInteractions(backupRepo);
    });

    test('should return error when books repo fails to list books', () async {
      // given
      final failure = TestingFailure();
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => withError(failure));

      final backupRepo = makeMockBackupRepo();

      final makeBackup = MakeBackupImpl(backupRepo, booksRepo);

      // when
      final result = await makeBackup(BackupParams(path: fakePath()));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError(), failure);
    });

    test('should return error when backup repo fails', () async {
      // given
      final books = [fakeBook()];
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));

      final backupPath = fakePath();
      final failure = TestingFailure();
      final backupRepo = makeMockBackupRepo();
      when(
        backupRepo.saveAll(backupPath, books),
      ).thenAnswer((_) => withError(failure));

      final makeBackup = MakeBackupImpl(backupRepo, booksRepo);

      // when
      final result = await makeBackup(BackupParams(path: backupPath));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError(), failure);
    });
  });
}
