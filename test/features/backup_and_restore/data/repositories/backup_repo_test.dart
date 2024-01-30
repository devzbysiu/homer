import 'dart:io';

import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/data/repositories/backup_repo.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('loadAll', () {
    test('should return missing file failure when backup file does not exist',
        () async {
      // given
      final notExistingPath = fakePath();
      final failingDataSource = MockBackupDataSource();
      when(failingDataSource.loadAll(notExistingPath)).thenThrow(
        const FileSystemException(),
      );

      final repo = BackupRepo(dataSource: failingDataSource);

      // when
      final result = await repo.loadAll(notExistingPath);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError(), MissingBackupFileFailure(notExistingPath));
    });

    test('should return list of restored books on success', () async {
      // given
      final failingDataSource = MockBackupDataSource();
      final books = [fakeBackupBookDTO()];
      when(failingDataSource.loadAll(any)).thenAnswer((_) => withIt(books));

      final repo = BackupRepo(dataSource: failingDataSource);

      final notImportantPath = fakePath();

      // when
      final result = await repo.loadAll(notImportantPath);

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!.length, books.length);
    });
  });

  group('saveAll', () {
    test('should return missing file failure when backup file does not exist',
        () async {
      // given
      final notExistingPath = fakePath();
      final failingDataSource = makeMockBackupDataSource();
      when(failingDataSource.saveAll(notExistingPath, any)).thenThrow(
        const FileSystemException(),
      );

      final repo = BackupRepo(dataSource: failingDataSource);

      final List<Book> notImportant = List.empty();

      // when
      final result = await repo.saveAll(notExistingPath, notImportant);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError(), MissingBackupFileFailure(notExistingPath));
    });

    test('should return success when all books saved', () async {
      // given
      final workingDataSource = makeMockBackupDataSource();
      when(workingDataSource.saveAll(any, any)).thenAnswer((_) => withUnit());

      final repo = BackupRepo(dataSource: workingDataSource);

      // when
      final result = await repo.saveAll(fakePath(), []);

      // then
      expect(result.isSuccess(), true);
    });
  });
}
