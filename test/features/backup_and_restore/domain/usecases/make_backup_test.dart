import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/domain/repositories/backup_repository.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/make_backup.dart';
import 'package:homer/features/manage_books/domain/repositories/books_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils.dart';
import 'make_backup_test.mocks.dart';

@GenerateMocks([BackupRepository, BooksRepository])
void main() {
  group('makeBackup', () {
    test('should use books repo to load all books', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll())
          .thenAnswer((_) => Future.value(const Success([])));
      final backupRepo = makeMockBackupRepo();
      when(backupRepo.saveAll(any, any))
          .thenAnswer((_) => Future.value(const Success(unit)));
      final makeBackup = MakeBackupImpl(backupRepo, booksRepo);

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
      when(booksRepo.listAll()).thenAnswer((_) => Future.value(Success(books)));

      final backupRepo = makeMockBackupRepo();
      when(backupRepo.saveAll(any, any))
          .thenAnswer((_) => Future.value(const Success(unit)));
      final makeBackup = MakeBackupImpl(backupRepo, booksRepo);

      final backupPath = fakePath();

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
      when(booksRepo.listAll()).thenAnswer((_) => Future.value(Error(failure)));

      final backupRepo = makeMockBackupRepo();

      final makeBackup = MakeBackupImpl(backupRepo, booksRepo);

      // when
      final result = await makeBackup(BackupParams(path: fakePath()));

      // then
      verify(booksRepo.listAll());
      expect(result.isError(), true);
      expect(result.tryGetError(), failure);
      verifyNoMoreInteractions(booksRepo);
      verifyNoMoreInteractions(backupRepo);
    });

    test('should return error when backup repo fails', () async {
      // given
      final books = [fakeBook()];
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => Future.value(Success(books)));

      final backupPath = fakePath();
      final failure = TestingFailure();
      final backupRepo = makeMockBackupRepo();
      when(backupRepo.saveAll(backupPath, books))
          .thenAnswer((_) => Future.value(Error(failure)));

      final makeBackup = MakeBackupImpl(backupRepo, booksRepo);

      // when
      final result = await makeBackup(BackupParams(path: backupPath));

      // then
      verify(booksRepo.listAll());
      verify(backupRepo.saveAll(backupPath, books));
      expect(result.isError(), true);
      expect(result.tryGetError(), failure);
      verifyNoMoreInteractions(booksRepo);
      verifyNoMoreInteractions(backupRepo);
    });
  });
}

MockBooksRepository makeMockBooksRepo() {
  final mockRepo = MockBooksRepository();
  provideDummy<Result<List<Book>, Failure>>(const Success([]));
  return mockRepo;
}

MockBackupRepository makeMockBackupRepo() {
  final mockRepo = MockBackupRepository();
  provideDummy<Result<Unit, Failure>>(const Success(unit));
  return mockRepo;
}
