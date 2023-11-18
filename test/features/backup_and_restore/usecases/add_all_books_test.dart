import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/add_all_books.dart';
import 'package:homer/features/manage_books/domain/repositories/books_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../test_utils.dart';
import 'add_all_books_test.mocks.dart';

@GenerateMocks([BooksRepository])
void main() {
  group('addAllBooks', () {
    test('should use books repo to add all books', () async {
      // given
      final mockRepo = makeMockRepo();
      final books = [fakeBook()];
      when(mockRepo.addAll(books)).thenAnswer(withSuccess);
      final addAllBooks = AddAllBooks(mockRepo);
      verifyZeroInteractions(mockRepo);

      // when
      final _ = await addAllBooks(AddAllParams(books: books));

      // then
      verify(mockRepo.addAll(books));
      verifyNoMoreInteractions(mockRepo);
    });

    test('should propagate success result from books repo', () async {
      // given
      final mockRepo = makeMockRepo();
      final notImportant = [fakeBook()];
      when(mockRepo.addAll(any)).thenAnswer(withSuccess);
      final addAllBooks = AddAllBooks(mockRepo);

      // when
      final result = await addAllBooks(AddAllParams(books: notImportant));

      // then
      expect(result.isSuccess(), true);
    });

    test('should propagate error result from books repo', () async {
      // given
      final mockRepo = makeMockRepo();
      final notImportant = [fakeBook()];
      final error = TestingFailure();
      when(mockRepo.addAll(any)).thenAnswer((_) => withError(error));
      final addAllBooks = AddAllBooks(mockRepo);

      // when
      final result = await addAllBooks(AddAllParams(books: notImportant));

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
  // NOTE: Mockito requires to add return value for both cases in Result<T, E>
  //   (i.e. T - Success case, E - error case), even when you don't expect both
  provideDummy<Result<Unit, Failure>>(const Success(unit));
  return mockRepo;
}
