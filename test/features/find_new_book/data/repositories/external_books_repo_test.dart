import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/error/exceptions.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/find_new_book/data/datasources/external_book_info_data_source.dart';
import 'package:homer/features/find_new_book/data/datasources/external_books_data_source.dart';
import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart';
import 'package:homer/features/find_new_book/data/repositories/external_books_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_utils.dart';
import '../../../../test_utils/fakes.dart';
import 'external_books_repo_test.mocks.dart';

@GenerateMocks([ExternalBooksDataSource, ExternalBookInfoDataSource])
void main() {
  group('search', () {
    test('should return empty list when query is empty', () async {
      // given
      final booksDataSource = MockExternalBooksDataSource();
      when(booksDataSource.getFromQuery(any)).thenAnswer(
        (_) => withIt([fakeExternalBookDTO()]),
      );

      final repo = ExternalBooksRepo(
        booksDataSource: booksDataSource,
        bookInfoDataSource: makeMockBookInfoDatasource(),
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
      when(booksDataSource.getFromQuery(any)).thenAnswer(
        (_) => withIt([fakeExternalBookDTO()]),
      );

      final repo = ExternalBooksRepo(
        booksDataSource: booksDataSource,
        bookInfoDataSource: makeMockBookInfoDatasource(),
      );

      const blankQuery = '               ';

      // when
      final result = await repo.search(blankQuery);

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!.isEmpty, true);
    });

    test('should return list of external books when search works', () async {
      // given
      final externalBooks = [fakeExternalBookDTO(), fakeExternalBookDTO()];
      final booksDataSource = MockExternalBooksDataSource();
      when(booksDataSource.getFromQuery(any)).thenAnswer(
        (_) => withIt(externalBooks),
      );

      final repo = ExternalBooksRepo(
        booksDataSource: booksDataSource,
        bookInfoDataSource: makeMockBookInfoDatasource(),
      );

      final notImportantQuery = fakeSearchQuery();

      // when
      final result = await repo.search(notImportantQuery);

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!.length, externalBooks.length);
    });

    test('should return failure when search failed', () async {
      // given
      final booksDataSource = MockExternalBooksDataSource();
      when(booksDataSource.getFromQuery(any)).thenThrow(
        BooksQueryException(faker.lorem.sentence()),
      );

      final repo = ExternalBooksRepo(
        booksDataSource: booksDataSource,
        bookInfoDataSource: makeMockBookInfoDatasource(),
      );

      final notImportantQuery = fakeSearchQuery();

      // when
      final result = await repo.search(notImportantQuery);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, SearchingForBooksFailure());
    });
  });

  group('fromUrl', () {
    test('should return failure when url is empty', () async {
      // given
      final bookInfoDataSource = makeMockBookInfoDatasource();
      final booksDataSource = MockExternalBooksDataSource();

      final repo = ExternalBooksRepo(
        booksDataSource: booksDataSource,
        bookInfoDataSource: bookInfoDataSource,
      );

      const emptyUrl = '';

      // when
      final result = await repo.fromUrl(emptyUrl);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, const InvalidUrlSharedFailure(emptyUrl));
    });

    test('should return failure when url is broken', () async {
      // given
      const brokenUrl = 'ht//\\#';
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromUrl(brokenUrl)).thenThrow(
        const InvalidUrlException(brokenUrl),
      );

      final booksDataSource = MockExternalBooksDataSource();

      final repo = ExternalBooksRepo(
        booksDataSource: booksDataSource,
        bookInfoDataSource: bookInfoDataSource,
      );

      // when
      final result = await repo.fromUrl(brokenUrl);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, const InvalidUrlSharedFailure(brokenUrl));
    });

    test('should return failure when no isbn was found', () async {
      // given
      final url = fakeUrl();
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromUrl(url)).thenAnswer(
        (_) => Future.value(fakeExternalBookInfoDTO().copyWith(
          isbn10: none(),
          isbn13: none(),
        )),
      );

      final booksDataSource = MockExternalBooksDataSource();

      final repo = ExternalBooksRepo(
        booksDataSource: booksDataSource,
        bookInfoDataSource: bookInfoDataSource,
      );

      // when
      final result = await repo.fromUrl(url);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, NoIsbnFailure(url));
    });
  });
}

MockExternalBookInfoDataSource makeMockBookInfoDatasource() {
  final mock = MockExternalBookInfoDataSource();
  provideDummy<ExternalBookInfoDTO>(fakeExternalBookInfoDTO());
  return mock;
}
