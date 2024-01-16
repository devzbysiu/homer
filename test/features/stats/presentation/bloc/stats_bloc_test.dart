import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/stats/domain/entities/books_per_year.dart';
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

    blocTest<StatsBloc, StatsState>(
      'should emit loaded with loaded stats on start',
      build: () => BlocMock().onLoadStats(Success(booksPerYear)).get(),
      act: (bloc) => {/* do nothing */},
      // TODO: All bloc tests should create the state manually in `expect`
      expect: () => [StatsState.loaded(some(booksPerYear))],
      verify: (bloc) => verify(bloc.loadBooksPerYear(NoParams())),
    );

    blocTest<StatsBloc, StatsState>(
      'should emit loadFailed when loading stats fails',
      build: () => BlocMock().onLoadStats(Error(TestingFailure())).get(),
      act: (bloc) => {/* do nothing */},
      expect: () => [const StatsState.loadFailed()],
      verify: (bloc) => verify(bloc.loadBooksPerYear(NoParams())),
    );
  });

  group('_onBookFinished', () {
    final booksPerYear = fakeBooksPerYear();
    final book = fakeBook().copyWith(endDate: some(DateTime(2024)));

    blocTest<StatsBloc, StatsState>(
      'should emit bookFinished with updated stats',
      build: () => BlocMock().onLoadStats(Success(booksPerYear)).get(),
      act: (bloc) => bloc.add(BookFinished(book)),
      expect: () => [
        StatsState.loaded(some(booksPerYear)),
        StatsState.loaded(some(booksPerYear)).bookFinished(book),
      ],
      verify: (bloc) => verify(bloc.loadBooksPerYear(NoParams())),
    );

    blocTest<StatsBloc, StatsState>(
      'should emit loadFailed when loading stats fails',
      build: () => BlocMock().onLoadStats(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(BookFinished(book)),
      expect: () => [const StatsState.loadFailed()],
      verify: (bloc) => verify(bloc.loadBooksPerYear(NoParams())),
    );
  });

  group('_onBookUnfinished', () {
    final booksPerYear = fakeBooksPerYear();
    final book = fakeBook().copyWith(endDate: some(DateTime(2024)));

    blocTest<StatsBloc, StatsState>(
      'should emit undoFinished with updated stats',
      build: () => BlocMock().onLoadStats(Success(booksPerYear)).get(),
      act: (bloc) => bloc.add(BookUnfinished(book)),
      expect: () => [
        StatsState.loaded(some(booksPerYear)),
        StatsState.loaded(some(booksPerYear)).undoFinished(book),
      ],
      verify: (bloc) => verify(bloc.loadBooksPerYear(NoParams())),
    );

    blocTest<StatsBloc, StatsState>(
      'should emit loadFailed when loading stats fails',
      build: () => BlocMock().onLoadStats(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(BookUnfinished(book)),
      expect: () => [const StatsState.loadFailed()],
      verify: (bloc) => verify(bloc.loadBooksPerYear(NoParams())),
    );
  });
}

final class BlocMock {
  BlocMock() {
    provideDummy<Result<BooksPerYear, Failure>>(Success(fakeBooksPerYear()));

    _loadBooksPerYear = MockLoadBooksPerYear();

    when(_loadBooksPerYear.call(any)).thenAnswer(
      (_) => withSuccess(fakeBooksPerYear()),
    );
  }

  late final MockLoadBooksPerYear _loadBooksPerYear;

  BlocMock onLoadStats(Result<BooksPerYear, Failure> ret) {
    when(_loadBooksPerYear.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  StatsBloc get() => _createMock();

  StatsBloc _createMock() {
    return StatsBloc(
      loadBooksPerYear: _loadBooksPerYear,
    );
  }

  StatsBloc allWorking() => _createMock();
} //
