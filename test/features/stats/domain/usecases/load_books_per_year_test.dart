import 'package:dartz/dartz.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/stats/domain/entities/books_per_year_data.dart';
import 'package:homer/features/stats/domain/usecases/load_books_per_year.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('loadBooksPerYear', () {
    test('should use books repo to read books', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final books = [fakeBook(), fakeBook(), fakeBook()];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));
      final loadBooksPerYear = LoadBooksPerYearImpl(booksRepo);

      verifyZeroInteractions(booksRepo);

      // when
      final _ = await loadBooksPerYear(NoParams());

      // then
      verify(booksRepo.listAll());
      verifyNoMoreInteractions(booksRepo);
    });

    test('should return failure when books repo fails', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => withError(TestingFailure()));
      final loadBooksPerYear = LoadBooksPerYearImpl(booksRepo);

      // when
      final result = await loadBooksPerYear(NoParams());

      // then
      expect(result.isError(), true);
    });

    test('should return books grouped by year when books repo works', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final books = [
        fakeBook().copyWith(endDate: some(DateTime(2024))),
        fakeBook().copyWith(endDate: some(DateTime(2023))),
        fakeBook().copyWith(endDate: some(DateTime(2022))),
        fakeBook().copyWith(endDate: some(DateTime(2024))),
        fakeBook().copyWith(endDate: some(DateTime(2021))),
      ];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));
      final loadBooksPerYear = LoadBooksPerYearImpl(booksRepo);

      // when
      final result = await loadBooksPerYear(NoParams());

      // then
      expect(result.isSuccess(), true);
      expect(
        result.tryGetSuccess()!,
        BooksPerYearData(const {
          2021: 1,
          2022: 1,
          2023: 1,
          2024: 2,
        }),
      );
    });

    test('should return empty group of books when no books saved', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final List<Book> books = [];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));
      final loadBooksPerYear = LoadBooksPerYearImpl(booksRepo);

      // when
      final result = await loadBooksPerYear(NoParams());

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, BooksPerYearData(const {}));
    });

    test('should ignore not finished books', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final books = [
        fakeBook().copyWith(endDate: some(DateTime(2024))),
        fakeBook().copyWith(endDate: some(DateTime(2023))),
        fakeBook().copyWith(endDate: some(DateTime(2022))),
        fakeBook().copyWith(endDate: none()),
        fakeBook().copyWith(endDate: none()),
      ];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));
      final loadBooksPerYear = LoadBooksPerYearImpl(booksRepo);

      // when
      final result = await loadBooksPerYear(NoParams());

      // then
      expect(result.isSuccess(), true);
      expect(
        result.tryGetSuccess()!,
        BooksPerYearData(const {
          2022: 1,
          2023: 1,
          2024: 1,
        }),
      );
    });
  });
}