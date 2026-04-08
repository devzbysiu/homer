import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/manage_books/domain/usecases/list_books.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('listBooks', () {
    test('should use books repo to list all books', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final allBooks = [fakeBook(), fakeBook(), fakeBook()];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(allBooks));

      final filterBooks = ListSortedBooksImpl(booksRepo);

      verifyZeroInteractions(booksRepo);

      // when
      final _ = await filterBooks(NoParams());

      // then
      verify(booksRepo.listAll());
    });

    test('should return failure when books repo failed', () async {
      // given
      final failure = TestingFailure();
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => withError(failure));

      final listBooks = ListSortedBooksImpl(booksRepo);

      // when
      final result = await listBooks(NoParams());

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, failure);
    });

    test('should list all books when books repo works', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final allBooks = [fakeBook(), fakeBook(), fakeBook()];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(allBooks));

      final filterBooks = ListSortedBooksImpl(booksRepo);

      // when
      final result = await filterBooks(NoParams());

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!.length, allBooks.length);
    });
  });
}
