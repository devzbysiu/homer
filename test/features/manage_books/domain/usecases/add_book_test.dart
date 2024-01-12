import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/manage_books/domain/usecases/add_book.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('addBook', () {
    test('should use booksRepo to add updated book', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.add(any)).thenAnswer((_) => withSuccess(unit));

      final book = fakeBook();

      final addBook = AddBookImpl(booksRepo);

      verifyZeroInteractions(booksRepo);

      // when
      final _ = await addBook(AddParams(
        book: book,
        bookState: BookState.read,
        selectedTags: const [],
      ));

      // then
      verify(booksRepo.add(
        book.copyWith(state: BookState.read, tags: const []),
      ));
      verifyNoMoreInteractions(booksRepo);
    });

    test('should return failure when books repo failed', () async {
      // given
      final failure = TestingFailure();
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.add(any)).thenAnswer((_) => withError(failure));

      final addBook = AddBookImpl(booksRepo);

      final book = fakeBook();

      // when
      final result = await addBook(AddParams(
        book: book,
        bookState: BookState.read,
        selectedTags: const [],
      ));

      // then
      expect(result.isError(), true);
      expect(result.tryGetError()!, failure);
    });

    test('should return success when books repo work', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.add(any)).thenAnswer((_) => withSuccess(unit));

      final book = fakeBook();

      final addBook = AddBookImpl(booksRepo);

      // when
      final result = await addBook(AddParams(
        book: book,
        bookState: BookState.read,
        selectedTags: const [],
      ));

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
