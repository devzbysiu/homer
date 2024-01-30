import 'package:homer/core/entities/book.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/stats/domain/entities/books_per_state_data.dart';
import 'package:homer/features/stats/domain/usecases/load_books_per_state.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('loadBooksPerState', () {
    test('should use books repo to read books', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final books = [fakeBook(), fakeBook(), fakeBook()];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));
      final loadBooksPerState = LoadBooksPerStateImpl(booksRepo);

      verifyZeroInteractions(booksRepo);

      // when
      final _ = await loadBooksPerState(NoParams());

      // then
      verify(booksRepo.listAll());
      verifyNoMoreInteractions(booksRepo);
    });

    test('should return failure when books repo fails', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => withError(TestingFailure()));
      final loadBooksPerState = LoadBooksPerStateImpl(booksRepo);

      // when
      final result = await loadBooksPerState(NoParams());

      // then
      expect(result.isError(), true);
    });

    test('should return books grouped by state when books repo works',
        () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final books = [
        fakeBook().copyWith(state: BookState.reading),
        fakeBook().copyWith(state: BookState.reading),
        fakeBook().copyWith(state: BookState.readLater),
        fakeBook().copyWith(state: BookState.read),
        fakeBook().copyWith(state: BookState.read),
      ];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));
      final loadBooksPerState = LoadBooksPerStateImpl(booksRepo);

      // when
      final result = await loadBooksPerState(NoParams());

      // then
      expect(result.isSuccess(), true);
      expect(
        result.tryGetSuccess()!,
        BooksPerStateData({
          const ComparableBookState(BookState.readLater): 1,
          const ComparableBookState(BookState.reading): 2,
          const ComparableBookState(BookState.read): 2,
        }),
      );
    });

    test('should return empty group of books when no books saved', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final List<Book> books = [];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));
      final loadBooksPerState = LoadBooksPerStateImpl(booksRepo);

      // when
      final result = await loadBooksPerState(NoParams());

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, BooksPerStateData(const {}));
    });

    test('should ignore not finished books', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final books = [
        fakeBook().copyWith(state: BookState.reading),
        fakeBook().copyWith(state: BookState.reading),
        fakeBook().copyWith(state: BookState.readLater),
        fakeBook().copyWith(state: BookState.read),
        fakeBook().copyWith(state: BookState.read),
      ];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));
      final loadBooksPerState = LoadBooksPerStateImpl(booksRepo);

      // when
      final result = await loadBooksPerState(NoParams());

      // then
      expect(result.isSuccess(), true);
      expect(
        result.tryGetSuccess()!,
        BooksPerStateData({
          const ComparableBookState(BookState.readLater): 1,
          const ComparableBookState(BookState.reading): 2,
          const ComparableBookState(BookState.read): 2,
        }),
      );
    });
  });
}
