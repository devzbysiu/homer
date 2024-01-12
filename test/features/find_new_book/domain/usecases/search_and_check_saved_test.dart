import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/find_new_book/domain/usecases/search_and_check_saved.dart';
import 'package:homer/features/find_new_book/domain/usecases/search_for_books.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('searchForBooks', () {
    test('should use external books and books repo to search for books',
        () async {
      // given
      final externalBooksRepo = makeMockExternalBooksRepo();
      final query = fakeSearchQuery();
      final foundBooks = [fakeBook(), fakeBook(), fakeBook()];
      when(externalBooksRepo.search(query)).thenAnswer(
        (_) => withSuccess(foundBooks),
      );

      final booksRepo = makeMockBooksRepo();
      final savedBooks = [foundBooks[0]];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(savedBooks));

      final searchForBooks = SearchAndCheckSaved(externalBooksRepo, booksRepo);

      verifyZeroInteractions(externalBooksRepo);
      verifyZeroInteractions(booksRepo);

      // when
      final _ = await searchForBooks(SearchParams(query: query));

      // then
      verify(externalBooksRepo.search(query));
      verify(booksRepo.listAll());
      verifyNoMoreInteractions(externalBooksRepo);
      verifyNoMoreInteractions(booksRepo);
    });

    test('should return failure when external books repo failed', () async {
      // given
      final externalBooksRepo = makeMockExternalBooksRepo();
      final query = fakeSearchQuery();
      final failure = TestingFailure();
      when(externalBooksRepo.search(query)).thenAnswer(
        (_) => withError(failure),
      );

      final booksRepo = makeMockBooksRepo();

      final searchForBooks = SearchAndCheckSaved(externalBooksRepo, booksRepo);

      // when
      final result = await searchForBooks(SearchParams(query: query));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, failure);
    });

    test('should return failure when books repo failed', () async {
      // given
      final externalBooksRepo = makeMockExternalBooksRepo();
      final query = fakeSearchQuery();
      final foundBooks = [fakeBook(), fakeBook(), fakeBook()];
      when(externalBooksRepo.search(query)).thenAnswer(
        (_) => withSuccess(foundBooks),
      );

      final booksRepo = makeMockBooksRepo();
      final failure = TestingFailure();
      when(booksRepo.listAll()).thenAnswer((_) => withError(failure));

      final searchForBooks = SearchAndCheckSaved(externalBooksRepo, booksRepo);

      // when
      final result = await searchForBooks(SearchParams(query: query));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, failure);
    });

    test('should return success with saved books marked', () async {
      // given
      final externalBooksRepo = makeMockExternalBooksRepo();
      final query = fakeSearchQuery();
      final foundBooks = [fakeBook(), fakeBook(), fakeBook()];
      when(externalBooksRepo.search(query)).thenAnswer(
        (_) => withSuccess(foundBooks),
      );

      final booksRepo = makeMockBooksRepo();
      final savedBooks = [foundBooks[0]];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(savedBooks));

      final searchForBooks = SearchAndCheckSaved(externalBooksRepo, booksRepo);

      // when
      final result = await searchForBooks(SearchParams(query: query));

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, [
        foundBooks[0].copyWith(alreadySaved: true),
        foundBooks[1],
        foundBooks[2],
      ]);
    });

    test('should return success with zero book marked as saved', () async {
      // given
      final externalBooksRepo = makeMockExternalBooksRepo();
      final query = fakeSearchQuery();
      final foundBooks = [fakeBook(), fakeBook(), fakeBook()];
      when(externalBooksRepo.search(query)).thenAnswer(
        (_) => withSuccess(foundBooks),
      );

      final booksRepo = makeMockBooksRepo();
      final savedBooks = [fakeBook()];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(savedBooks));

      final searchForBooks = SearchAndCheckSaved(externalBooksRepo, booksRepo);

      // when
      final result = await searchForBooks(SearchParams(query: query));

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, foundBooks);
    });
  });
}

MockBooksRepository makeMockBooksRepo() {
  final mockRepo = MockBooksRepository();
  provideDummy<Result<List<Book>, Failure>>(const Success([]));
  return mockRepo;
}

MockExternalBooksRepository makeMockExternalBooksRepo() {
  final mockRepo = MockExternalBooksRepository();
  provideDummy<Result<List<Book>, Failure>>(Success([fakeBook()]));
  return mockRepo;
}
