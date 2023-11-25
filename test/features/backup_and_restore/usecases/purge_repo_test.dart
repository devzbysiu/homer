import 'package:homer/core/error/failures.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/backup_and_restore/domain/usecases/purge_repo.dart';
import 'package:homer/features/manage_books/domain/repositories/books_repository.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../test_utils.dart';
import 'purge_repo_test.mocks.dart';

@GenerateMocks([BooksRepository])
void main() {
  group('purgeRepo', () {
    test('should use books repo to remove all books', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final purgeRepo = PurgeRepo(booksRepo);
      when(booksRepo.deleteAll())
          .thenAnswer((_) => Future.value(const Success(unit)));

      // when
      final _ = await purgeRepo(NoParams());

      // then
      verify(booksRepo.deleteAll());
      verifyNoMoreInteractions(booksRepo);
    });

    test('should return success when books repo succeeds', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final purgeRepo = PurgeRepo(booksRepo);
      when(booksRepo.deleteAll())
          .thenAnswer((_) => Future.value(const Success(unit)));

      // when
      final result = await purgeRepo(NoParams());

      // then
      verify(booksRepo.deleteAll());
      expect(result.isSuccess(), true);
      verifyNoMoreInteractions(booksRepo);
    });

    test('should return error when books repo fails', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final purgeRepo = PurgeRepo(booksRepo);
      final failure = TestingFailure();
      when(booksRepo.deleteAll())
          .thenAnswer((_) => Future.value(Error(failure)));

      // when
      final result = await purgeRepo(NoParams());

      // then
      verify(booksRepo.deleteAll());
      expect(result.isError(), true);
      expect(result.tryGetError(), failure);
      verifyNoMoreInteractions(booksRepo);
    });
  });
}

MockBooksRepository makeMockBooksRepo() {
  final mockRepo = MockBooksRepository();
  // NOTE: Mockito requires to add return value for both cases in Result<T, E>
  //   (i.e. T - Success case, E - error case), even when you don't expect both
  provideDummy<Result<Unit, Failure>>(const Success(unit));
  return mockRepo;
}
