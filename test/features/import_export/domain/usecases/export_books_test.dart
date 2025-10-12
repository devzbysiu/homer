import 'package:homer/features/import_export/domain/usecases/export_books.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('exportBooks', () {
    test('should use books repo to load all books', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess([]));

      final importExportRepo = makeMockImportExportRepo();
      when(
        importExportRepo.saveAll(any, any),
      ).thenAnswer((_) => withSuccess(unit));

      final exportBooks = ExportBooksImpl(importExportRepo, booksRepo);

      verifyZeroInteractions(booksRepo);

      // when
      final _ = await exportBooks(ExportParams(path: fakePath()));

      // then
      verify(booksRepo.listAll());
      verifyNoMoreInteractions(booksRepo);
    });

    test('should use import export repo to save all books', () async {
      // given
      final books = [fakeBook()];
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));

      final importExportRepo = makeMockImportExportRepo();
      when(importExportRepo.saveAll(any, any)).thenAnswer((_) => withSuccess(unit));
      final exportBooks = ExportBooksImpl(importExportRepo, booksRepo);

      final exportPath = fakePath();

      verifyZeroInteractions(importExportRepo);

      // when
      final _ = await exportBooks(ExportParams(path: exportPath));

      // then
      verify(importExportRepo.saveAll(exportPath, books));
      verifyNoMoreInteractions(importExportRepo);
    });

    test('should return error when books repo fails to list books', () async {
      // given
      final failure = TestingFailure();
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => withError(failure));

      final importExportRepo = makeMockImportExportRepo();

      final exportBooks = ExportBooksImpl(importExportRepo, booksRepo);

      // when
      final result = await exportBooks(ExportParams(path: fakePath()));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError(), failure);
    });

    test('should return error when import export repo fails', () async {
      // given
      final books = [fakeBook()];
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));

      final exportPath = fakePath();
      final failure = TestingFailure();
      final importExportRepo = makeMockImportExportRepo();
      when(
        importExportRepo.saveAll(exportPath, books),
      ).thenAnswer((_) => withError(failure));

      final exportBooks = ExportBooksImpl(importExportRepo, booksRepo);

      // when
      final result = await exportBooks(ExportParams(path: exportPath));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError(), failure);
    });
  });
}
