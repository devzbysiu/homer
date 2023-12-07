import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/error/exceptions.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/find_new_book/data/datasources/external_book_info_data_source.dart';
import 'package:homer/features/find_new_book/data/datasources/external_books_data_source.dart';
import 'package:homer/features/find_new_book/data/models/external_book_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart';
import 'package:homer/features/find_new_book/data/repositories/external_books_repo.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_utils/assertion_helpers.dart';
import '../../../../test_utils/copy_with_extensions.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import 'external_books_repo_test.mocks.dart';

@GenerateMocks([ExternalBooksDataSource, ExternalBookInfoDataSource])
void main() {
  group('search', () {
    test('should return empty list when query is empty', () async {
      // given
      final booksDataSource = makeMockExternalBooksDataSource();
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
      final booksDataSource = makeMockExternalBooksDataSource();
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
      final booksDataSource = makeMockExternalBooksDataSource();
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
      final booksDataSource = makeMockExternalBooksDataSource();
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

      final repo = ExternalBooksRepo(
        booksDataSource: makeMockExternalBooksDataSource(),
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

      final repo = ExternalBooksRepo(
        booksDataSource: makeMockExternalBooksDataSource(),
        bookInfoDataSource: bookInfoDataSource,
      );

      // when
      final result = await repo.fromUrl(brokenUrl);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, const InvalidUrlSharedFailure(brokenUrl));
    });

    test('should return failure when response is not json', () async {
      // given
      final url = fakeUrl();
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromUrl(url)).thenThrow(
        const NotJsonException('not important'),
      );

      final repo = ExternalBooksRepo(
        booksDataSource: makeMockExternalBooksDataSource(),
        bookInfoDataSource: bookInfoDataSource,
      );

      // when
      final result = await repo.fromUrl(url);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, ServerFailure());
    });

    test('should return failure when wrong json was returned', () async {
      // given
      final url = fakeUrl();
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromUrl(url)).thenThrow(
        const WrongJsonException('not important'),
      );

      final repo = ExternalBooksRepo(
        booksDataSource: makeMockExternalBooksDataSource(),
        bookInfoDataSource: bookInfoDataSource,
      );

      // when
      final result = await repo.fromUrl(url);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, ServerFailure());
    });

    test('should return failure when request timed out', () async {
      // given
      final url = fakeUrl();
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromUrl(url)).thenThrow(
        TimeoutException('not important'),
      );

      final repo = ExternalBooksRepo(
        booksDataSource: makeMockExternalBooksDataSource(),
        bookInfoDataSource: bookInfoDataSource,
      );

      // when
      final result = await repo.fromUrl(url);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, const TimeoutOnApiResponseFailure());
    });

    test('should return failure when no book found by isbn', () async {
      // given
      final url = fakeUrl();
      final bookInfo = fakeExternalBookInfoDTO();
      final isbn = bookInfo.isbn.toNullable()!;
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromUrl(url)).thenAnswer(
        (_) => withIt(bookInfo),
      );

      final booksDataSource = makeMockExternalBooksDataSource();
      when(booksDataSource.getFromIsbn(any)).thenThrow(
        NoBookFoundException(isbn),
      );

      final repo = ExternalBooksRepo(
        booksDataSource: booksDataSource,
        bookInfoDataSource: bookInfoDataSource,
      );

      // when
      final result = await repo.fromUrl(url);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, NoBookWithIsbnFailure(isbn));
    });

    test('should return failure when too many books were found', () async {
      // given
      final url = fakeUrl();
      final bookInfo = fakeExternalBookInfoDTO();
      final isbn = bookInfo.isbn.toNullable()!;
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromUrl(url)).thenAnswer(
        (_) => withIt(bookInfo),
      );

      final booksDataSource = makeMockExternalBooksDataSource();
      when(booksDataSource.getFromIsbn(any)).thenThrow(
        TooManyBooksFoundException(isbn),
      );

      final repo = ExternalBooksRepo(
        booksDataSource: booksDataSource,
        bookInfoDataSource: bookInfoDataSource,
      );

      // when
      final result = await repo.fromUrl(url);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, TooManyBooksFoundFailure(isbn));
    });

    test('should return failure when no isbn was found', () async {
      // given
      final url = fakeUrl();
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromUrl(url)).thenAnswer(
        (_) => withIt(fakeExternalBookInfoDTO().copyWith(
          isbn10: none(),
          isbn13: none(),
        )),
      );

      final repo = ExternalBooksRepo(
        booksDataSource: makeMockExternalBooksDataSource(),
        bookInfoDataSource: bookInfoDataSource,
      );

      // when
      final result = await repo.fromUrl(url);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, NoIsbnFailure(url));
    });

    test('should return remote book when everything works', () async {
      // given
      final url = fakeUrl();
      final bookInfo = fakeExternalBookInfoDTO();
      final bookInfoDataSource = makeMockBookInfoDatasource();
      when(bookInfoDataSource.getFromUrl(url)).thenAnswer(
        (_) => withIt(bookInfo),
      );

      final bookDTO = fakeExternalBookDTO();
      final booksDataSource = makeMockExternalBooksDataSource();
      when(booksDataSource.getFromIsbn(any)).thenAnswer((_) => withIt(bookDTO));

      final repo = ExternalBooksRepo(
        booksDataSource: booksDataSource,
        bookInfoDataSource: bookInfoDataSource,
      );

      // when
      final result = await repo.fromUrl(url);

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, bookFromExternalBookDTO(bookDTO));
    });
  });
}

MockExternalBooksDataSource makeMockExternalBooksDataSource() {
  final mock = MockExternalBooksDataSource();
  provideDummy<ExternalBookDTO>(fakeExternalBookDTO());
  return mock;
}

MockExternalBookInfoDataSource makeMockBookInfoDatasource() {
  final mock = MockExternalBookInfoDataSource();
  provideDummy<ExternalBookInfoDTO>(fakeExternalBookInfoDTO());
  return mock;
}
