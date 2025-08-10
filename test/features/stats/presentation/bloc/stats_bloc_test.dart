import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/stats/domain/entities/books_per_month_data.dart';
import 'package:homer/features/stats/domain/entities/books_per_state_data.dart';
import 'package:homer/features/stats/domain/entities/books_per_year_data.dart';
import 'package:homer/features/stats/domain/entities/other_stats_data.dart';
import 'package:homer/features/stats/presentation/bloc/stats_bloc.dart';
import 'package:homer/features/stats/presentation/bloc/stats_event.dart';
import 'package:homer/features/stats/presentation/bloc/stats_state.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('_onStatsLoaded', () {
    final booksPerYear = fakeBooksPerYear();
    final booksPerMonth = fakeBooksPerMonth();
    final booksPerState = fakeBooksPerState();
    final otherStats = fakeOtherStats();

    blocTest<StatsBloc, StatsState>(
      'should emit loaded with loaded stats on start',
      build:
          () =>
              BlocMock()
                  .onLoadStats(
                    Success(booksPerYear),
                    Success(booksPerMonth),
                    Success(booksPerState),
                    Success(otherStats),
                  )
                  .get(),
      act: (bloc) => bloc.add(LoadStats()),
      expect:
          () => [
            StatsState.loaded(
              booksPerYear: booksPerYear,
              booksPerMonth: booksPerMonth,
              booksPerState: booksPerState,
              otherStats: otherStats,
            ),
          ],
      verify: (bloc) {
        verify(bloc.loadBooksPerYear(NoParams()));
        verify(bloc.loadBooksPerMonth(NoParams()));
        verify(bloc.loadBooksPerState(NoParams()));
        verify(bloc.loadOtherStats(NoParams()));
      },
    );

    blocTest<StatsBloc, StatsState>(
      'should emit loadFailed when loading bpy fails but other stats work',
      build:
          () =>
              BlocMock()
                  .onLoadStats(
                    Error(TestingFailure()),
                    Success(booksPerMonth),
                    Success(booksPerState),
                    Success(otherStats),
                  )
                  .get(),
      act: (bloc) => bloc.add(LoadStats()),
      expect: () => [StatsState.loadFailed()],
      verify: (bloc) {
        verify(bloc.loadBooksPerYear(NoParams()));
        verify(bloc.loadBooksPerMonth(NoParams()));
        verify(bloc.loadBooksPerState(NoParams()));
        verify(bloc.loadOtherStats(NoParams()));
      },
    );

    blocTest<StatsBloc, StatsState>(
      'should emit loadFailed when loading bpm fails but other stats work',
      build:
          () =>
              BlocMock()
                  .onLoadStats(
                    Success(booksPerYear),
                    Error(TestingFailure()),
                    Success(booksPerState),
                    Success(otherStats),
                  )
                  .get(),
      act: (bloc) => bloc.add(LoadStats()),
      expect: () => [StatsState.loadFailed()],
      verify: (bloc) {
        verify(bloc.loadBooksPerYear(NoParams()));
        verify(bloc.loadBooksPerMonth(NoParams()));
        verify(bloc.loadBooksPerState(NoParams()));
        verify(bloc.loadOtherStats(NoParams()));
      },
    );

    blocTest<StatsBloc, StatsState>(
      'should emit loadFailed when loading bps fails but other stats work',
      build:
          () =>
              BlocMock()
                  .onLoadStats(
                    Success(booksPerYear),
                    Success(booksPerMonth),
                    Error(TestingFailure()),
                    Success(otherStats),
                  )
                  .get(),
      act: (bloc) => bloc.add(LoadStats()),
      expect: () => [StatsState.loadFailed()],
      verify: (bloc) {
        verify(bloc.loadBooksPerYear(NoParams()));
        verify(bloc.loadBooksPerMonth(NoParams()));
        verify(bloc.loadBooksPerState(NoParams()));
        verify(bloc.loadOtherStats(NoParams()));
      },
    );

    blocTest<StatsBloc, StatsState>(
      'should emit loadFailed when loading os fails but other stats work',
      build:
          () =>
              BlocMock()
                  .onLoadStats(
                    Success(booksPerYear),
                    Success(booksPerMonth),
                    Success(booksPerState),
                    Error(TestingFailure()),
                  )
                  .get(),
      act: (bloc) => bloc.add(LoadStats()),
      expect: () => [StatsState.loadFailed()],
      verify: (bloc) {
        verify(bloc.loadBooksPerYear(NoParams()));
        verify(bloc.loadBooksPerMonth(NoParams()));
        verify(bloc.loadBooksPerState(NoParams()));
        verify(bloc.loadOtherStats(NoParams()));
      },
    );
  });

  group('_onBookFinished', () {
    final booksPerYear = fakeBooksPerYear();
    final booksPerMonth = fakeBooksPerMonth();
    final booksPerState = fakeBooksPerState();
    final otherStats = fakeOtherStats();
    final book = fakeBook().copyWith(endDate: some(DateTime(2024)));

    blocTest<StatsBloc, StatsState>(
      'should emit loaded with updated stats',
      seed:
          () => StatsState(
            booksPerYear: some(booksPerYear),
            booksPerMonth: some(booksPerMonth),
            booksPerState: some(booksPerState),
            otherStats: some(otherStats),
          ),
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(BookFinished(book)),
      expect:
          () => [
            StatsState.loaded(
              booksPerYear: booksPerYear.add(book),
              booksPerMonth: booksPerMonth.add(book),
              booksPerState: booksPerState.move(
                BookState.reading,
                BookState.read,
              ),
              otherStats: otherStats.add(book),
            ),
          ],
    );
  });

  group('_onBookUnfinished', () {
    final booksPerYear = fakeBooksPerYear();
    final booksPerMonth = fakeBooksPerMonth();
    final booksPerState = fakeBooksPerState();
    final otherStats = fakeOtherStats();
    final book = fakeBook().copyWith(endDate: some(DateTime(2024)));

    blocTest<StatsBloc, StatsState>(
      'should emit loaded with undone finish book with updated stats',
      seed:
          () => StatsState(
            booksPerYear: some(booksPerYear),
            booksPerMonth: some(booksPerMonth),
            booksPerState: some(booksPerState),
            otherStats: some(otherStats),
          ),
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(BookUnfinished(book)),
      expect:
          () => [
            StatsState.loaded(
              booksPerYear: booksPerYear.remove(book),
              booksPerMonth: booksPerMonth.remove(book),
              booksPerState: booksPerState.move(
                BookState.read,
                BookState.reading,
              ),
              otherStats: otherStats.remove(book),
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
    provideDummy<Result<BooksPerStateData, Failure>>(
      Success(fakeBooksPerState()),
    );
    provideDummy<Result<OtherStatsData, Failure>>(Success(fakeOtherStats()));

    _loadBooksPerYear = MockLoadBooksPerYear();
    _loadBooksPerMonth = MockLoadBooksPerMonth();
    _loadBooksPerState = MockLoadBooksPerState();
    _loadOtherStats = MockLoadOtherStats();
  }

  late final MockLoadBooksPerYear _loadBooksPerYear;

  late final MockLoadBooksPerMonth _loadBooksPerMonth;

  late final MockLoadBooksPerState _loadBooksPerState;

  late final MockLoadOtherStats _loadOtherStats;

  BlocMock onLoadStats(
    Result<BooksPerYearData, Failure> bpy,
    Result<BooksPerMonthData, Failure> bpm,
    Result<BooksPerStateData, Failure> bps,
    Result<OtherStatsData, Failure> os,
  ) {
    when(_loadBooksPerYear.call(any)).thenAnswer((_) => Future.value(bpy));
    when(_loadBooksPerMonth.call(any)).thenAnswer((_) => Future.value(bpm));
    when(_loadBooksPerState.call(any)).thenAnswer((_) => Future.value(bps));
    when(_loadOtherStats.call(any)).thenAnswer((_) => Future.value(os));
    return this;
  }

  StatsBloc get() => _createMock();

  StatsBloc _createMock() {
    return StatsBloc(
      loadBooksPerYear: _loadBooksPerYear,
      loadBooksPerMonth: _loadBooksPerMonth,
      loadBooksPerState: _loadBooksPerState,
      loadOtherStats: _loadOtherStats,
    );
  }

  StatsBloc allWorking() => _createMock();
}
