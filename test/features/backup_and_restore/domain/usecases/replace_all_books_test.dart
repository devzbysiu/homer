import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/replace_all_books.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('replaceAllBooks', () {
    test('should use books repo to replace all books', () async {
      // given
      final mockRepo = makeMockRepo();
      final books = [fakeBook()];
      when(mockRepo.replaceAll(books)).thenAnswer((_) => withSuccess(unit));

      final replaceAllBooks = ReplaceAllBooksImpl(mockRepo);

      verifyZeroInteractions(mockRepo);

      // when
      final _ = await replaceAllBooks(ReplaceParams(books: books));

      // then
      verify(mockRepo.replaceAll(books));
      verifyNoMoreInteractions(mockRepo);
    });

    test('should propagate success result from books repo', () async {
      // given
      final mockRepo = makeMockRepo();
      when(mockRepo.replaceAll(any)).thenAnswer((_) => withSuccess(unit));

      final replaceAllBooks = ReplaceAllBooksImpl(mockRepo);

      final notImportant = [fakeBook()];

      // when
      final result = await replaceAllBooks(
        ReplaceParams(books: notImportant),
      );

      // then
      expect(result.isSuccess(), true);
    });

    test('should propagate error result from books repo', () async {
      // given
      final mockRepo = makeMockRepo();
      final failure = TestingFailure();
      when(mockRepo.replaceAll(any)).thenAnswer((_) => withError(failure));

      final replaceAllBooks = ReplaceAllBooksImpl(mockRepo);

      final notImportant = [fakeBook()];

      // when
      final result = await replaceAllBooks(
        ReplaceParams(books: notImportant),
      );

      // then
      expect(result.isError(), true);
      expect(result, Error(failure));
    });
  });
}

MockBooksRepository makeMockRepo() {
  final mockRepo = MockBooksRepository();
  provideDummy<Result<Unit, Failure>>(const Success(unit));
  return mockRepo;
}
