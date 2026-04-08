import 'package:homer/features/import_export/domain/usecases/import_books.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('importBooks', () {
    test('should use import export repo to load all books', () async {
      // given
      final mockRepo = makeMockImportExportRepo();
      final path = fakePath();
      when(mockRepo.loadAll(path)).thenAnswer((_) => withSuccess([]));

      final importBooks = ImportBooksImpl(mockRepo);

      verifyZeroInteractions(mockRepo);

      // when
      final _ = await importBooks(ImportParams(path: path));

      // then
      verify(mockRepo.loadAll(path));
      verifyNoMoreInteractions(mockRepo);
    });

    test('should propagate success result from import export repo', () async {
      // given
      final mockRepo = makeMockImportExportRepo();
      final books = [fakeBook()];
      when(mockRepo.loadAll(any)).thenAnswer((_) => withSuccess(books));

      final importBooks = ImportBooksImpl(mockRepo);

      final notImportant = fakePath();

      // when
      final result = await importBooks(ImportParams(path: notImportant));

      // then
      expect(result.isSuccess(), true);
      expect(result, Success(books));
    });

    test('should propagate error result from import export repo', () async {
      // given
      final mockRepo = makeMockImportExportRepo();
      final error = TestingFailure();
      when(mockRepo.loadAll(any)).thenAnswer((_) => withError(error));

      final importBooks = ImportBooksImpl(mockRepo);

      final notImportant = fakePath();

      // when
      final result = await importBooks(ImportParams(path: notImportant));

      // then
      expect(result.isError(), true);
      expect(result, Error(error));
    });
  });
}
