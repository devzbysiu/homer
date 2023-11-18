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
  group('call', () {
    test('should use repo to add all books', () async {
      // given
      final mockRepo = MockBooksRepository();
      provideDummy<Result<Unit, Failure>>(
          const Error(MissingBackupFileFailure('')));
      final books = [fakeBook()];
      when(mockRepo.addAll(books))
          .thenAnswer((_) => Future.value(const Success(unit)));
      final addAllBooks = AddAllBooks(mockRepo);

      // when
      addAllBooks(AddAllParams(books: books));

      // then
      verify(mockRepo.addAll(books));
      verifyNoMoreInteractions(mockRepo);
    });

    test('should return list of restored books on success', () async {});
  });
}
