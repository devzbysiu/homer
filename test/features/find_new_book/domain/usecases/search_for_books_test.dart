import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/find_new_book/domain/repositories/external_books_repository.dart';
import 'package:homer/features/find_new_book/domain/usecases/search_for_books.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import 'fetch_shared_book_test.mocks.dart';

@GenerateMocks([ExternalBooksRepository])
void main() {
  group('searchForBooks', () {
    test('should return failure when book info repo failed', () async {
      // given
      final booksRepo = makeMockExternalBooksRepository();
      final failure = TestingFailure();
      when(booksRepo.search(any)).thenAnswer(
        (_) => withFailure(failure),
      );

      final query = fakeSearchQuery();

      final searchForBooks = SearchForBooksImpl(booksRepo);

      // when
      final result = await searchForBooks(SearchParams(query: query));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, failure);
    });

    test('should return success when book info repo works', () async {
      // given
      final books = [fakeBook(), fakeBook()];
      final booksRepo = makeMockExternalBooksRepository();
      when(booksRepo.search(any)).thenAnswer((_) => withSuccess(books));

      final query = fakeSearchQuery();

      final searchForBooks = SearchForBooksImpl(booksRepo);

      // when
      final result = await searchForBooks(SearchParams(query: query));

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, books);
    });
  });
}

MockExternalBooksRepository makeMockExternalBooksRepository() {
  final mockRepo = MockExternalBooksRepository();
  provideDummy<Result<List<Book>, Failure>>(Success([fakeBook()]));
  return mockRepo;
}
