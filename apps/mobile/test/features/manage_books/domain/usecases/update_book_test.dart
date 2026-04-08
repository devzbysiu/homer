import 'package:flutter_test/flutter_test.dart';
import 'package:homer/features/manage_books/domain/usecases/update_book.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('updateBook', () {
    test('should use books repo to update book', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final book = fakeBook();
      when(booksRepo.update(book)).thenAnswer((_) => withSuccess(unit));

      final updateBook = UpdateBookImpl(booksRepo);

      verifyZeroInteractions(booksRepo);

      // when
      final _ = await updateBook(UpdateParams(modified: book));

      // then
      verify(booksRepo.update(book));
      verifyNoMoreInteractions(booksRepo);
    });

    test('should return failure when books repo failed', () async {
      // given
      final failure = TestingFailure();
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.update(any)).thenAnswer((_) => withError(failure));

      final updateBook = UpdateBookImpl(booksRepo);

      final book = fakeBook();

      // when
      final result = await updateBook(UpdateParams(modified: book));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, failure);
    });

    test('should return success when books repo work', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.update(any)).thenAnswer((_) => withSuccess(unit));

      final updateBook = UpdateBookImpl(booksRepo);

      final book = fakeBook();

      // when
      final result = await updateBook(UpdateParams(modified: book));

      // then
      expect(result.isSuccess(), true);
    });
  });
}
