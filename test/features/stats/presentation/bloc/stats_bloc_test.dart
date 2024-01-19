import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/stats/domain/entities/books_per_month_data.dart';
import 'package:homer/features/stats/domain/entities/books_per_year_data.dart';
import 'package:homer/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('_onStatsLoaded', () {
    final booksPerYear = fakeBooksPerYear();
    final booksPerMonth = fakeBooksPerMonth();

    blocTest<StatsBloc, StatsState>(
      'should emit loaded with loaded stats on start',
      build: () => BlocMock()
          .onLoadStats(Success(booksPerYear), Success(booksPerMonth))
          .get(),
      act: (bloc) => bloc.add(LoadStats()),
      expect: () => [
        StatsState(
          booksPerYear: some(booksPerYear),
          booksPerMonth: some(booksPerMonth),
        ),
      ],
      verify: (bloc) {
        verify(bloc.loadBooksPerYear(NoParams()));
        verify(bloc.loadBooksPerMonth(NoParams()));
      },
    );

    blocTest<StatsBloc, StatsState>(
      'should emit loadFailed when loading bpy fails but bpm succeeds',
      build: () => BlocMock()
          .onLoadStats(Error(TestingFailure()), Success(booksPerMonth))
          .get(),
      act: (bloc) => bloc.add(LoadStats()),
      expect: () => [
        const StatsState(
          booksPerYear: None(),
          booksPerMonth: None(),
        ),
      ],
      verify: (bloc) {
        verify(bloc.loadBooksPerYear(NoParams()));
        verify(bloc.loadBooksPerMonth(NoParams()));
      },
    );

    blocTest<StatsBloc, StatsState>(
      'should emit loadFailed when loading bpm fails but bpy succeeds',
      build: () => BlocMock()
          .onLoadStats(Success(booksPerYear), Error(TestingFailure()))
          .get(),
      act: (bloc) => bloc.add(LoadStats()),
      expect: () => [
        const StatsState(
          booksPerYear: None(),
          booksPerMonth: None(),
        ),
      ],
      verify: (bloc) {
        verify(bloc.loadBooksPerYear(NoParams()));
        verify(bloc.loadBooksPerMonth(NoParams()));
      },
    );
  });

  group('_onBookFinished', () {
    final booksPerYear = fakeBooksPerYear();
    final booksPerMonth = fakeBooksPerMonth();
    final book = fakeBook().copyWith(endDate: some(DateTime(2024)));

    blocTest<StatsBloc, StatsState>(
      'should emit loaded with updated stats',
      seed: () => StatsState(
        booksPerYear: some(booksPerYear),
        booksPerMonth: some(booksPerMonth),
      ),
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(BookFinished(book)),
      expect: () => [
        StatsState(
          booksPerYear: some(booksPerYear.add(book)),
          booksPerMonth: some(booksPerMonth.add(book)),
        ),
      ],
    );
  });

  group('_onBookUnfinished', () {
    final booksPerYear = fakeBooksPerYear();
    final booksPerMonth = fakeBooksPerMonth();
    final book = fakeBook().copyWith(endDate: some(DateTime(2024)));

    blocTest<StatsBloc, StatsState>(
      'should emit undoFinished with updated stats',
      seed: () => StatsState(
        booksPerYear: some(booksPerYear),
        booksPerMonth: some(booksPerMonth),
      ),
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(BookUnfinished(book)),
      expect: () => [
        StatsState(
          booksPerYear: some(booksPerYear.remove(book)),
          booksPerMonth: some(booksPerMonth.remove(book)),
        ),
      ],
    );
  });
}

final class BlocMock {
  BlocMock() {
    provideDummy<Result<BooksPerYearData, Failure>>(
      Success(fakeBooksPerYear()),
    );
    provideDummy<Result<BooksPerMonthData, Failure>>(
      Success(fakeBooksPerMonth()),
    );

    _loadBooksPerYear = MockLoadBooksPerYear();
    _loadBooksPerMonth = MockLoadBooksPerMonth();

    when(_loadBooksPerYear.call(any)).thenAnswer(
      (_) => withSuccess(fakeBooksPerYear()),
    );
  }

  late final MockLoadBooksPerYear _loadBooksPerYear;

  late final MockLoadBooksPerMonth _loadBooksPerMonth;

  BlocMock onLoadStats(
    Result<BooksPerYearData, Failure> bpy,
    Result<BooksPerMonthData, Failure> bpm,
  ) {
    when(_loadBooksPerYear.call(any)).thenAnswer((_) => Future.value(bpy));
    when(_loadBooksPerMonth.call(any)).thenAnswer((_) => Future.value(bpm));
    return this;
  }

  StatsBloc get() => _createMock();

  StatsBloc _createMock() {
    return StatsBloc(
      loadBooksPerYear: _loadBooksPerYear,
      loadBooksPerMonth: _loadBooksPerMonth,
    );
  }

  StatsBloc allWorking() => _createMock();
}
