import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/replace_all_books.dart';
import 'package:homer/features/manage_books/domain/repositories/books_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils.dart';
import '../../../../test_utils/fakes.dart';
import 'replace_all_books_test.mocks.dart';

@GenerateMocks([BooksRepository])
void main() {
  group('replaceAllBooks', () {
    test('should use books repo to replace all books', () async {
      // given
      final mockRepo = makeMockRepo();
      final books = [fakeBook()];
      when(mockRepo.replaceAll(books)).thenAnswer(withSuccess);

      final replaceAllBooks = ReplaceAllBooksImpl(mockRepo);

      verifyZeroInteractions(mockRepo);

      // when
      final _ = await replaceAllBooks(ReplaceAllParams(books: books));

      // then
      verify(mockRepo.replaceAll(books));
      verifyNoMoreInteractions(mockRepo);
    });

    test('should propagate success result from books repo', () async {
      // given
      final mockRepo = makeMockRepo();
      when(mockRepo.replaceAll(any)).thenAnswer(withSuccess);

      final replaceAllBooks = ReplaceAllBooksImpl(mockRepo);

      final notImportant = [fakeBook()];

      // when
      final result = await replaceAllBooks(
        ReplaceAllParams(books: notImportant),
      );

      // then
      expect(result.isSuccess(), true);
    });

    test('should propagate error result from books repo', () async {
      // given
      final mockRepo = makeMockRepo();
      final error = TestingFailure();
      when(mockRepo.replaceAll(any)).thenAnswer((_) => withError(error));

      final replaceAllBooks = ReplaceAllBooksImpl(mockRepo);

      final notImportant = [fakeBook()];

      // when
      final result = await replaceAllBooks(
        ReplaceAllParams(books: notImportant),
      );

      // then
      expect(result.isError(), true);
      expect(result, Error(error));
    });
  });
}

Future<Result<Unit, Failure>> withSuccess(_) {
  return Future.value(const Success(unit));
}

Future<Result<Unit, Failure>> withError(error) {
  return Future.value(Error(error));
}

MockBooksRepository makeMockRepo() {
  final mockRepo = MockBooksRepository();
  provideDummy<Result<Unit, Failure>>(const Success(unit));
  return mockRepo;
}
