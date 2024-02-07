import 'package:flutter_test/flutter_test.dart';
import 'package:homer/features/find_new_book/domain/usecases/fetch_shared_book_info.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('fetchSharedBookInfo', () {
    test('should use external book info repo', () async {
      // given
      final bookInfo = fakeExternalBookInfo();
      final externalBookInfoRepo = makeMockExternalBookInfoRepo();
      when(externalBookInfoRepo.fromUrl(any)).thenAnswer(
        (_) => withSuccess(bookInfo),
      );

      final fetchSharedBookInfo = FetchSharedBookInfoImpl(externalBookInfoRepo);

      final url = fakeUrl();

      verifyZeroInteractions(externalBookInfoRepo);

      // when
      final _ = await fetchSharedBookInfo(FetchInfoParams(url: url));

      // then
      verify(externalBookInfoRepo.fromUrl(url));
      verifyNoMoreInteractions(externalBookInfoRepo);
    });

    test('should return failure when book info repo failed', () async {
      // given
      final failure = TestingFailure();
      final externalBooksInfoRepo = makeMockExternalBookInfoRepo();
      when(externalBooksInfoRepo.fromUrl(any)).thenAnswer(
        (_) => withError(failure),
      );

      final fetchSharedBook = FetchSharedBookInfoImpl(externalBooksInfoRepo);

      final url = fakeUrl();

      // when
      final result = await fetchSharedBook(FetchInfoParams(url: url));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, failure);
    });

    test('should return success when book info repo work', () async {
      // given
      final bookInfo = fakeExternalBookInfo();
      final externalBookInfoRepo = makeMockExternalBookInfoRepo();
      when(externalBookInfoRepo.fromUrl(any)).thenAnswer(
        (_) => withSuccess(bookInfo),
      );

      final fetchSharedBookInfo = FetchSharedBookInfoImpl(externalBookInfoRepo);

      final url = fakeUrl();

      // when
      final result = await fetchSharedBookInfo(FetchInfoParams(url: url));

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, bookInfo);
    });
  });
}
