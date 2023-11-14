import 'dart:io';

import 'package:faker/faker.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/data/datasources/dante_backup_data_source.dart';
import 'package:homer/features/backup_and_restore/data/repositories/local_backup_repo.dart';
import 'package:homer/features/manage_books/domain/entities/local_book.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../test_utils.dart';
import 'local_backup_repo_test.mocks.dart';

@GenerateMocks([LocalBackupDataSource])
void main() {
  group('loadAll', () {
    test('should return missing file failure when backup file does not exist',
        () async {
      // given
      final notExistingPath = _fakePath();
      final failingDataSource = MockLocalBackupDataSource();
      when(failingDataSource.loadAll(notExistingPath))
          .thenThrow(const FileSystemException());
      final repo = LocalBackupRepo(dataSource: failingDataSource);

      // when
      final result = await repo.loadAll(notExistingPath);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError(), MissingBackupFileFailure(notExistingPath));
    });

    test('should return list of restored books on success', () async {
      // given
      final notImportantPath = _fakePath();
      final failingDataSource = MockLocalBackupDataSource();
      final booksList = [fakeLocalBackupBookDTO()];
      when(failingDataSource.loadAll(any))
          .thenAnswer((_) => Future.value(booksList));
      final repo = LocalBackupRepo(dataSource: failingDataSource);

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
      final notExistingPath = _fakePath();
      final List<LocalBook> notImportant = List.empty();
      final failingDataSource = MockLocalBackupDataSource();
      when(failingDataSource.saveAll(notExistingPath, any))
          .thenThrow(const FileSystemException());
      final repo = LocalBackupRepo(dataSource: failingDataSource);

      // when
      final result = await repo.saveAll(notExistingPath, notImportant);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError(), MissingBackupFileFailure(notExistingPath));
    });
  });
}

String _fakePath() => '/${faker.lorem.words(3).join('/')}';
