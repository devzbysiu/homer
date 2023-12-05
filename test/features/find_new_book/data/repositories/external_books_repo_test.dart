import 'package:flutter_test/flutter_test.dart';
import 'package:homer/features/find_new_book/data/datasources/external_book_info_data_source.dart';
import 'package:homer/features/find_new_book/data/datasources/external_books_data_source.dart';
import 'package:homer/features/find_new_book/data/repositories/external_books_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_utils.dart';
import 'external_books_repo_test.mocks.dart';

@GenerateMocks([ExternalBooksDataSource, ExternalBookInfoDataSource])
void main() {
  group('search', () {
    test('should return empty list when query is empty', () async {
      // given
      final booksDataSource = MockExternalBooksDataSource();
      when(booksDataSource.getFromQuery(any))
          .thenAnswer((_) => Future.value([fakeExternalBookDTO()]));

      final bookInfoDataSource = MockExternalBookInfoDataSource();

      final repo = ExternalBooksRepo(
        booksDataSource: booksDataSource,
        bookInfoDataSource: bookInfoDataSource,
      );

      const emptyQuery = '';

      // when
      final result = await repo.search(emptyQuery);

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!.isEmpty, true);
    });

    test('should return empty list when query is blank', () async {
      // given
      final booksDataSource = MockExternalBooksDataSource();
      when(booksDataSource.getFromQuery(any))
          .thenAnswer((_) => Future.value([fakeExternalBookDTO()]));

      final bookInfoDataSource = MockExternalBookInfoDataSource();

      final repo = ExternalBooksRepo(
        booksDataSource: booksDataSource,
        bookInfoDataSource: bookInfoDataSource,
      );

      const blankQuery = '               ';

      // when
      final result = await repo.search(blankQuery);

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!.isEmpty, true);
    });
  });
}
