import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/error/exceptions.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/find_new_book/data/models/external_book_dto.dart';
import 'package:homer/features/find_new_book/data/repositories/external_books_repo.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_utils/assertion_helpers.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('search', () {
    test('should return empty list when query is empty', () async {
      // given
      final booksDataSource = makeMockExternalBooksDataSource();
      when(booksDataSource.getFromQuery(any)).thenAnswer(
        (_) => withIt([fakeExternalBookDTO()]),
      );

      final repo = ExternalBooksRepo(booksDataSource: booksDataSource);

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

      final repo = ExternalBooksRepo(booksDataSource: booksDataSource);

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

      final repo = ExternalBooksRepo(booksDataSource: booksDataSource);

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

      final repo = ExternalBooksRepo(booksDataSource: booksDataSource);

      final notImportantQuery = fakeSearchQuery();

      // when
      final result = await repo.search(notImportantQuery);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, SearchingForBooksFailure());
    });
  });

  group('fromBookInfo', () {
    test('should return failure when no book found by isbn', () async {
      // given
      final bookInfo = fakeExternalBookInfo();
      final isbn = bookInfo.isbn;

      final booksDataSource = makeMockExternalBooksDataSource();
      when(booksDataSource.getFromIsbn(any)).thenThrow(
        NoBookFoundException(isbn),
      );

      final repo = ExternalBooksRepo(booksDataSource: booksDataSource);

      // when
      final result = await repo.fromBookInfo(bookInfo);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, NoBookWithIsbnFailure(isbn));
    });

    test('should return failure when too many books were found', () async {
      // given
      final bookInfo = fakeExternalBookInfo();
      final isbn = bookInfo.isbn;

      final booksDataSource = makeMockExternalBooksDataSource();
      when(booksDataSource.getFromIsbn(any)).thenThrow(
        TooManyBooksFoundException(isbn),
      );

      final repo = ExternalBooksRepo(booksDataSource: booksDataSource);

      // when
      final result = await repo.fromBookInfo(bookInfo);

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, TooManyBooksFoundFailure(isbn));
    });

    test('should return remote book when everything works', () async {
      // given
      final bookInfo = fakeExternalBookInfo();
      final bookDTO = fakeExternalBookDTO();
      final booksDataSource = makeMockExternalBooksDataSource();
      when(booksDataSource.getFromIsbn(bookInfo.isbn)).thenAnswer(
        (_) => withIt(bookDTO),
      );

      final repo = ExternalBooksRepo(booksDataSource: booksDataSource);

      // when
      final result = await repo.fromBookInfo(bookInfo);

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
