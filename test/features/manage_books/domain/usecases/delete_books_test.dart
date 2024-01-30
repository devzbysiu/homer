import 'package:flutter_test/flutter_test.dart';
import 'package:homer/features/manage_books/domain/usecases/delete_books.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('deleteBooks', () {
    test('should use books repo to delete books', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final books = [fakeBook(), fakeBook(), fakeBook()];
      when(booksRepo.delete(books)).thenAnswer((_) => withSuccess(unit));

      final deleteBooks = DeleteBooksImpl(booksRepo);

      verifyZeroInteractions(booksRepo);

      // when
      final _ = await deleteBooks(DeleteParams(books: books));

      // then
      verify(booksRepo.delete(books));
      verifyNoMoreInteractions(booksRepo);
    });

    test('should return failure when books repo failed', () async {
      // given
      final failure = TestingFailure();
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.delete(any)).thenAnswer((_) => withError(failure));

      final deleteBooks = DeleteBooksImpl(booksRepo);

      final books = [fakeBook(), fakeBook(), fakeBook()];

      // when
      final result = await deleteBooks(DeleteParams(books: books));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, failure);
    });

    test('should return success when books repo work', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.delete(any)).thenAnswer((_) => withSuccess(unit));

      final deleteBooks = DeleteBooksImpl(booksRepo);

      final books = [fakeBook(), fakeBook(), fakeBook()];

      // when
      final result = await deleteBooks(DeleteParams(books: books));

      // then
      expect(result.isSuccess(), true);
    });
  });
}