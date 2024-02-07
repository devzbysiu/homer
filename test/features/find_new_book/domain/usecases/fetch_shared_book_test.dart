import 'package:flutter_test/flutter_test.dart';
import 'package:homer/features/find_new_book/domain/usecases/fetch_shared_book.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('fetchSharedBook', () {
    test('should use external books repo', () async {
      // given
      final book = fakeBook();
      final externalBooksRepo = makeMockExternalBooksRepo();
      when(externalBooksRepo.fromIsbn(any)).thenAnswer(
        (_) => withSuccess(book),
      );

      final fetchSharedBook = FetchSharedBookImpl(externalBooksRepo);

      final isbn = fakeIsbn();

      verifyZeroInteractions(externalBooksRepo);

      // when
      final _ = await fetchSharedBook(FetchBookParams(isbn: isbn));

      // then
      verify(externalBooksRepo.fromIsbn(isbn));
      verifyNoMoreInteractions(externalBooksRepo);
    });

    test('should return failure when books repo failed', () async {
      // given
      final failure = TestingFailure();
      final externalBooksRepo = makeMockExternalBooksRepo();
      when(externalBooksRepo.fromIsbn(any)).thenAnswer(
        (_) => withError(failure),
      );

      final fetchSharedBook = FetchSharedBookImpl(externalBooksRepo);

      final isbn = fakeIsbn();

      // when
      final result = await fetchSharedBook(FetchBookParams(isbn: isbn));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, failure);
    });

    test('should return success when books repo work', () async {
      // given
      final book = fakeBook();
      final externalBooksRepo = makeMockExternalBooksRepo();
      when(externalBooksRepo.fromIsbn(any)).thenAnswer(
        (_) => withSuccess(book),
      );

      final fetchSharedBook = FetchSharedBookImpl(externalBooksRepo);

      final isbn = fakeIsbn();

      // when
      final result = await fetchSharedBook(FetchBookParams(isbn: isbn));

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, book);
    });
  });
}
