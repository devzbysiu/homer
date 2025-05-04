import 'package:dartz/dartz.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/stats/domain/entities/books_per_month_data.dart';
import 'package:homer/features/stats/domain/entities/month_info.dart';
import 'package:homer/features/stats/domain/usecases/load_books_per_month.dart';
import 'package:mockito/mockito.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_factories.dart';
import '../../../../test_utils/mock_return_helpers.dart';

void main() {
  group('loadBooksPerMonth', () {
    test('should use books repo to read books', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final books = [fakeBook(), fakeBook(), fakeBook()];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));
      final loadBooksPerMonth = LoadBooksPerMonthImpl(booksRepo);

      verifyZeroInteractions(booksRepo);

      // when
      final _ = await loadBooksPerMonth(NoParams());

      // then
      verify(booksRepo.listAll());
      verifyNoMoreInteractions(booksRepo);
    });

    test('should return failure when books repo fails', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      when(booksRepo.listAll()).thenAnswer((_) => withError(TestingFailure()));
      final loadBooksPerMonth = LoadBooksPerMonthImpl(booksRepo);

      // when
      final result = await loadBooksPerMonth(NoParams());

      // then
      expect(result.isError(), true);
    });

    test(
      'should return books grouped by latest year and month when books repo works',
      () async {
        // given
        final booksRepo = makeMockBooksRepo();
        final books = [
          fakeBook().copyWith(endDate: some(DateTime(2024, 9))),
          fakeBook().copyWith(endDate: some(DateTime(2023, 9))),
          fakeBook().copyWith(endDate: some(DateTime(2023, 9))),
          fakeBook().copyWith(endDate: some(DateTime(2024, 8))),
          fakeBook().copyWith(endDate: some(DateTime(2021, 9))),
        ];
        when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));
        final loadBooksPerMonth = LoadBooksPerMonthImpl(booksRepo);

        // when
        final result = await loadBooksPerMonth(NoParams());

        // then
        expect(result.isSuccess(), true);
        expect(
          result.tryGetSuccess()!,
          BooksPerMonthData({
            MonthInfo(2021, 9): 1,
            MonthInfo(2023, 9): 2,
            MonthInfo(2024, 8): 1,
            MonthInfo(2024, 9): 1,
          }),
        );
      },
    );

    test('should return empty group of books when no books saved', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final List<Book> books = [];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));
      final loadBooksPerMonth = LoadBooksPerMonthImpl(booksRepo);

      // when
      final result = await loadBooksPerMonth(NoParams());

      // then
      expect(result.isSuccess(), true);
      expect(result.tryGetSuccess()!, BooksPerMonthData(const {}));
    });

    test('should ignore not finished books', () async {
      // given
      final booksRepo = makeMockBooksRepo();
      final books = [
        fakeBook().copyWith(endDate: some(DateTime(2024, 9))),
        fakeBook().copyWith(endDate: some(DateTime(2023, 9))),
        fakeBook().copyWith(endDate: some(DateTime(2022, 9))),
        fakeBook().copyWith(endDate: none()),
        fakeBook().copyWith(endDate: none()),
      ];
      when(booksRepo.listAll()).thenAnswer((_) => withSuccess(books));
      final loadBooksPerMonth = LoadBooksPerMonthImpl(booksRepo);

      // when
      final result = await loadBooksPerMonth(NoParams());

      // then
      expect(result.isSuccess(), true);
      expect(
        result.tryGetSuccess()!,
        BooksPerMonthData({
          MonthInfo(2024, 9): 1,
          MonthInfo(2023, 9): 1,
          MonthInfo(2022, 9): 1,
        }),
      );
    });
  });
}
