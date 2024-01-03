import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/manage_books/domain/usecases/delete_books.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('deleteBooks', () {
    test('should return failure when books repo failed', () async {
      // given
      final failure = TestingFailure();
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.delete(any)).thenAnswer((_) => withFailure(failure));

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

MockBooksRepository makeMockBooksRepo() {
  final mockRepo = MockBooksRepository();
  provideDummy<Result<Unit, Failure>>(const Success(unit));
  return mockRepo;
}
