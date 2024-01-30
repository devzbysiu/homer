import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/features/manage_books/domain/usecases/filter_books.dart';
import 'package:mockito/mockito.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('filterBooks', () {
    test('should use books repo to list all books before filtering', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final allBooks = [fakeBook(), fakeBook(), fakeBook()];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(allBooks));

      final filterBooks = FilterBooksImpl(booksRepo);

      final query = allBooks[0].title;

      verifyZeroInteractions(booksRepo);

      // when
      final _ = await filterBooks(FilterParams(query: query));

      // then
      verify(booksRepo.listAll());
      verifyNoMoreInteractions(booksRepo);
    });

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
      final allBooks = [
        fakeBook().copyWith(
          title: 'book 1 title',
          subtitle: 'book 1 subtitle',
          summary: some('book 1 summary'),
        ),
        fakeBook().copyWith(
          title: 'book 2 title',
          subtitle: 'book 2 subtitle',
          summary: some('book 2 summary'),
        ),
        fakeBook().copyWith(
          title: 'book 3 title',
          subtitle: 'book 3 subtitle',
          summary: some('book 3 summary'),
        )
      ];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(allBooks));

      final filterBooks = FilterBooksImpl(booksRepo);

      final query = allBooks[0].title;

      // when
      final result = await filterBooks(FilterParams(query: query));

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, [allBooks[0]]);
    });

    test('should filter using query matching one of the books subtitle',
        () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final allBooks = [
        fakeBook().copyWith(
          title: 'book 1 title',
          subtitle: 'book 1 subtitle',
          summary: some('book 1 summary'),
        ),
        fakeBook().copyWith(
          title: 'book 2 title',
          subtitle: 'book 2 subtitle',
          summary: some('book 2 summary'),
        ),
        fakeBook().copyWith(
          title: 'book 3 title',
          subtitle: 'book 3 subtitle',
          summary: some('book 3 summary'),
        )
      ];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(allBooks));

      final filterBooks = FilterBooksImpl(booksRepo);

      final query = allBooks[1].subtitle;

      // when
      final result = await filterBooks(FilterParams(query: query));

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, [allBooks[1]]);
    });

    test('should filter using query matching one of the books summary',
        () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final allBooks = [
        fakeBook().copyWith(
          title: 'book 1 title',
          subtitle: 'book 1 subtitle',
          summary: some('book 1 summary'),
        ),
        fakeBook().copyWith(
          title: 'book 2 title',
          subtitle: 'book 2 subtitle',
          summary: some('book 2 summary'),
        ),
        fakeBook().copyWith(
          title: 'book 3 title',
          subtitle: 'book 3 subtitle',
          summary: some('book 3 summary'),
        )
      ];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(allBooks));

      final filterBooks = FilterBooksImpl(booksRepo);

      final query = allBooks[2].summary.toNullable()!;

      // when
      final result = await filterBooks(FilterParams(query: query));

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, [allBooks[2]]);
    });

    test(
        'should return empty list when query does not match any book title, subtitle or summary',
        () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final allBooks = [fakeBook(), fakeBook(), fakeBook()];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(allBooks));

      final filterBooks = FilterBooksImpl(booksRepo);

      const query = 'some-random-text-not-found-in-books-title';

      // when
      final result = await filterBooks(const FilterParams(query: query));

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!.isEmpty, true);
    });
  });
}
