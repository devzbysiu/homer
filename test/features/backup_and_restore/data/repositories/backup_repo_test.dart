import 'dart:io';

import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/data/datasources/backup_data_source.dart';
import 'package:homer/features/backup_and_restore/data/repositories/backup_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils.dart';
import 'backup_repo_test.mocks.dart';

@GenerateMocks([BackupDataSource])
void main() {
  group('loadAll', () {
    test('should return missing file failure when backup file does not exist',
        () async {
      // given
      final notExistingPath = fakePath();
      final failingDataSource = MockBackupDataSource();
      when(failingDataSource.loadAll(notExistingPath))
          .thenThrow(const FileSystemException());
      final repo = BackupRepo(dataSource: failingDataSource);

      // when
      final result = await repo.loadAll(notExistingPath);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError(), MissingBackupFileFailure(notExistingPath));
    });

    test('should return list of restored books on success', () async {
      // given
      final notImportantPath = fakePath();
      final failingDataSource = MockBackupDataSource();
      final booksList = [fakeBackupBookDTO()];
      when(failingDataSource.loadAll(any))
          .thenAnswer((_) => Future.value(booksList));
      final repo = BackupRepo(dataSource: failingDataSource);

      // when
      final result = await repo.loadAll(notImportantPath);

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!.length, booksList.length);
    });
  });

  group('saveAll', () {
    test('should return missing file failure when backup file does not exist',
        () async {
      // given
      final notExistingPath = fakePath();
      final List<Book> notImportant = List.empty();
      final failingDataSource = makeMockBackupDataSource();
      when(failingDataSource.saveAll(notExistingPath, any))
          .thenThrow(const FileSystemException());
      final repo = BackupRepo(dataSource: failingDataSource);

      // when
      final result = await repo.saveAll(notExistingPath, notImportant);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError(), MissingBackupFileFailure(notExistingPath));
    });

    test('should return success when all books saved', () async {
      // given
      final workingDataSource = makeMockBackupDataSource();
      when(workingDataSource.saveAll(any, any))
          .thenAnswer((_) => Future.value(unit));
      final repo = BackupRepo(dataSource: workingDataSource);

      // when
      final result = await repo.saveAll(fakePath(), []);

      // then
      expect(result.isSuccess(), true);
    });
  });
}

MockBackupDataSource makeMockBackupDataSource() {
  final mockDataSource = MockBackupDataSource();
  provideDummy<Unit>(unit);
  return mockDataSource;
}
