import 'dart:io';

import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/import_export/data/repositories/import_export_repo.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('loadAll', () {
    test(
      'should return missing file failure when import file does not exist',
      () async {
        // given
        final notExistingPath = fakePath();
        final failingDataSource = MockImportExportDataSource();
        when(
          failingDataSource.loadAll(notExistingPath),
        ).thenThrow(const FileSystemException('test-failure'));

        final repo = ImportExportRepo(dataSource: failingDataSource);

        // when
        final result = await repo.loadAll(notExistingPath);

        // then
        expect(result.isError(), true);
        expect(
          result.tryGetError(),
          MissingImportFileFailure(notExistingPath, 'test-failure'),
        );
      },
    );

    test('should return list of imported books on success', () async {
      // given
      final failingDataSource = MockImportExportDataSource();
      final books = [fakeExportedBookDTO()];
      when(failingDataSource.loadAll(any)).thenAnswer((_) => withIt(books));

      final repo = ImportExportRepo(dataSource: failingDataSource);

      final notImportantPath = fakePath();

      // when
      final result = await repo.loadAll(notImportantPath);

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!.length, books.length);
    });
  });

  group('saveAll', () {
    test(
      'should return missing file failure when import file does not exist',
      () async {
        // given
        final notExistingPath = fakePath();
        final failingDataSource = makeMockImportExportDataSource();
        when(
          failingDataSource.saveAll(notExistingPath, any),
        ).thenThrow(const FileSystemException('test-failure'));

        final repo = ImportExportRepo(dataSource: failingDataSource);

        final List<Book> notImportant = List.empty();

        // when
        final result = await repo.saveAll(notExistingPath, notImportant);

        // then
        expect(result.isError(), true);
        expect(
          result.tryGetError(),
          MissingImportFileFailure(notExistingPath, 'test-failure'),
        );
      },
    );

    test('should return success when all books saved', () async {
      // given
      final workingDataSource = makeMockImportExportDataSource();
      when(workingDataSource.saveAll(any, any)).thenAnswer((_) => withUnit());

      final repo = ImportExportRepo(dataSource: workingDataSource);

      // when
      final result = await repo.saveAll(fakePath(), []);

      // then
      expect(result.isSuccess(), true);
    });
  });
}
