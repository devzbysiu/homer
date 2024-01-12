import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/find_new_book/domain/entities/external_book_info.dart';
import 'package:homer/features/find_new_book/domain/usecases/fetch_shared_book.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('fetchSharedBook', () {
    test('should use external book info and external books repos', () async {
      // given
      final externalBookInfoRepo = makeMockExternalBookInfoRepo();
      final bookInfo = fakeExternalBookInfo();
      when(externalBookInfoRepo.fromUrl(any)).thenAnswer(
        (_) => withSuccess(bookInfo),
      );

      final book = fakeBook();
      final externalBooksRepo = makeMockExternalBooksRepository();
      when(externalBooksRepo.fromBookInfo(any)).thenAnswer(
        (_) => withSuccess(book),
      );

      final fetchSharedBook = FetchSharedBookImpl(
        externalBookInfoRepo,
        externalBooksRepo,
      );

      final url = fakeUrl();

      verifyZeroInteractions(externalBookInfoRepo);
      verifyZeroInteractions(externalBooksRepo);

      // when
      final _ = await fetchSharedBook(FetchParams(url: url));

      // then
      verify(externalBookInfoRepo.fromUrl(url));
      verify(externalBooksRepo.fromBookInfo(bookInfo));
      verifyNoMoreInteractions(externalBookInfoRepo);
      verifyNoMoreInteractions(externalBooksRepo);
    });

    test('should return failure when book info repo failed', () async {
      // given
      final failure = TestingFailure();
      final externalBookInfoRepo = makeMockExternalBookInfoRepo();
      when(externalBookInfoRepo.fromUrl(any)).thenAnswer(
        (_) => withError(failure),
      );

      final fetchSharedBook = FetchSharedBookImpl(
        externalBookInfoRepo,
        makeMockExternalBooksRepository(),
      );

      final url = fakeUrl();

      // when
      final result = await fetchSharedBook(FetchParams(url: url));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, failure);
    });

    test('should return failure when books repo failed', () async {
      // given
      final externalBookInfoRepo = makeMockExternalBookInfoRepo();
      when(externalBookInfoRepo.fromUrl(any)).thenAnswer(
        (_) => withSuccess(fakeExternalBookInfo()),
      );

      final failure = TestingFailure();
      final externalBooksRepo = makeMockExternalBooksRepository();
      when(externalBooksRepo.fromBookInfo(any)).thenAnswer(
        (_) => withError(failure),
      );

      final fetchSharedBook = FetchSharedBookImpl(
        externalBookInfoRepo,
        externalBooksRepo,
      );

      final url = fakeUrl();

      // when
      final result = await fetchSharedBook(FetchParams(url: url));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, failure);
    });

    test('should return success when book info repo & books repo work',
        () async {
      // given
      final externalBookInfoRepo = makeMockExternalBookInfoRepo();
      when(externalBookInfoRepo.fromUrl(any)).thenAnswer(
        (_) => withSuccess(fakeExternalBookInfo()),
      );

      final book = fakeBook();
      final externalBooksRepo = makeMockExternalBooksRepository();
      when(externalBooksRepo.fromBookInfo(any)).thenAnswer(
        (_) => withSuccess(book),
      );

      final fetchSharedBook = FetchSharedBookImpl(
        externalBookInfoRepo,
        externalBooksRepo,
      );

      final url = fakeUrl();

      // when
      final result = await fetchSharedBook(FetchParams(url: url));

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, book);
    });
  });
}

MockExternalBookInfoRepository makeMockExternalBookInfoRepo() {
  final mockRepo = MockExternalBookInfoRepository();
  provideDummy<Result<ExternalBookInfo, Failure>>(
    Success(fakeExternalBookInfo()),
  );
  return mockRepo;
}

MockExternalBooksRepository makeMockExternalBooksRepository() {
  final mockRepo = MockExternalBooksRepository();
  provideDummy<Result<Book, Failure>>(Success(fakeBook()));
  return mockRepo;
}
