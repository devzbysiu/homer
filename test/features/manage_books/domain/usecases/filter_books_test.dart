import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/manage_books/domain/usecases/filter_books.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('filterBooks', () {
    test('should return failure when books repo failed', () async {
      // given
      final failure = TestingFailure();
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => withError(failure));

      final filterBooks = FilterBooksImpl(booksRepo);

      final query = fakeSearchQuery();

      // when
      final result = await filterBooks(FilterParams(query: query));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, failure);
    });

    test('should filter using query matching one of the books title', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final allBooks = [fakeBook(), fakeBook(), fakeBook()];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(allBooks));

      final filterBooks = FilterBooksImpl(booksRepo);

      final query = allBooks[0].title;

      // when
      final result = await filterBooks(FilterParams(query: query));

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, [allBooks[0]]);
    });

    test('should return empty list when query does not match any book title',
        () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final allBooks = [fakeBook(), fakeBook(), fakeBook()];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(allBooks));

      final filterBooks = FilterBooksImpl(booksRepo);

      const query = 'some-random-text-not-found-in-books-title';

      // when
      final result = await filterBooks(FilterParams(query: query));

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!.isEmpty, true);
    });
  });
}

MockBooksRepository makeMockBooksRepo() {
  final mockRepo = MockBooksRepository();
  provideDummy<Result<List<Book>, Failure>>(const Success([]));
  return mockRepo;
}
