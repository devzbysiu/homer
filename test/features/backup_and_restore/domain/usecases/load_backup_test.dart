import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/domain/repositories/backup_repository.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/load_backup.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils.dart';
import 'load_backup_test.mocks.dart';

@GenerateMocks([BackupRepository])
void main() {
  group('loadBackup', () {
    test('should use backup repo to load all books', () async {
      // given
      MockBackupRepository mockRepo = makeMockRepo();
      final path = fakePath();
      when(mockRepo.loadAll(path)).thenAnswer((_) => withSuccess([]));

      final loadBackup = LoadBackupImpl(mockRepo);

      verifyZeroInteractions(mockRepo);

      // when
      final _ = await loadBackup(RestoreParams(path: path));

      // then
      verify(mockRepo.loadAll(path));
      verifyNoMoreInteractions(mockRepo);
    });

    test('should propagate success result from backup repo', () async {
      // given
      MockBackupRepository mockRepo = makeMockRepo();
      final books = [fakeBook()];
      when(mockRepo.loadAll(any)).thenAnswer((_) => withSuccess(books));

      final loadBackup = LoadBackupImpl(mockRepo);

      verifyZeroInteractions(mockRepo);

      final notImportant = fakePath();

      // when
      final result = await loadBackup(RestoreParams(path: notImportant));

      // then
      expect(result.isSuccess(), true);
      expect(result, Success(books));
    });

    test('should propagate error result from backup repo', () async {
      // given
      MockBackupRepository mockRepo = makeMockRepo();
      final error = TestingFailure();
      when(mockRepo.loadAll(any)).thenAnswer((_) => withFailure(error));

      final loadBackup = LoadBackupImpl(mockRepo);

      verifyZeroInteractions(mockRepo);

      final notImportant = fakePath();

      // when
      final result = await loadBackup(RestoreParams(path: notImportant));

      // then
      expect(result.isError(), true);
      expect(result, Error(error));
    });
  });
}

MockBackupRepository makeMockRepo() {
  final mockRepo = MockBackupRepository();
  provideDummy<Result<List<Book>, Failure>>(const Success([]));
  return mockRepo;
}
