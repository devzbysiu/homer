import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/books_per_month_data.dart';
import '../../domain/entities/books_per_state_data.dart';
import '../../domain/entities/books_per_year_data.dart';
import '../../domain/entities/other_stats_data.dart';
import '../../domain/usecases/load_books_per_month.dart';
import '../../domain/usecases/load_books_per_state.dart';
import '../../domain/usecases/load_books_per_year.dart';
import '../../domain/usecases/load_other_stats.dart';
import 'stats_event.dart';
import 'stats_state.dart';

final class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc({
    required this.loadBooksPerYear,
    required this.loadBooksPerMonth,
    required this.loadBooksPerState,
    required this.loadOtherStats,
  }) : super(StatsState.initial()) {
    on<LoadStats>(_onLoadStats);
    on<BookFinished>(_onBookFinished);
    on<BookUnfinished>(_onBookUnfinished);
    on<BookStarted>(_onBookStarted);
    on<BookUnstarted>(_onBookUnstarted);
  }

  final LoadBooksPerYear loadBooksPerYear;

  final LoadBooksPerMonth loadBooksPerMonth;

  final LoadBooksPerState loadBooksPerState;

  final LoadOtherStats loadOtherStats;

  Future<void> _onLoadStats(LoadStats event, Emitter<StatsState> emit) async {
    final bpy = await loadBooksPerYear(NoParams());
    final bpm = await loadBooksPerMonth(NoParams());
    final bps = await loadBooksPerState(NoParams());
    final os = await loadOtherStats(NoParams());

    if (bpy.isError() || bpm.isError() || bps.isError() || os.isError()) {
      return emit(StatsState.loadFailed());
    }

    final booksPerYear = bpy.tryGetSuccess()!;
    final booksPerMonth = bpm.tryGetSuccess()!;
    final booksPerState = bps.tryGetSuccess()!;
    final otherStats = os.tryGetSuccess()!;

    emit(
      StatsState.loaded(
        booksPerYear: booksPerYear,
        booksPerMonth: booksPerMonth,
        booksPerState: booksPerState,
        otherStats: otherStats,
      ),
    );
  }

  Future<void> _onBookFinished(
    BookFinished event,
    Emitter<StatsState> emit,
  ) async {
    final newBpy = state.booksPerYear
        .getOrElse(() => BooksPerYearData.empty())
        .add(event.book);

    final newBpm = state.booksPerMonth
        .getOrElse(() => BooksPerMonthData.empty())
        .add(event.book);

    final newBps = state.booksPerState
        .getOrElse(() => BooksPerStateData.empty())
        .move(BookState.reading, BookState.read);

    final newOs = state.otherStats
        .getOrElse(() => OtherStatsData.empty())
        .add(event.book);

    emit(
      StatsState.loaded(
        booksPerYear: newBpy,
        booksPerMonth: newBpm,
        booksPerState: newBps,
        otherStats: newOs,
      ),
    );
  }

  Future<void> _onBookUnfinished(
    BookUnfinished event,
    Emitter<StatsState> emit,
  ) async {
    final newBpy = state.booksPerYear
        .map((bpy) => bpy.remove(event.book))
        .getOrElse(() => BooksPerYearData.empty());

    final newBpm = state.booksPerMonth
        .map((bpm) => bpm.remove(event.book))
        .getOrElse(() => BooksPerMonthData.empty());

    final newBps = state.booksPerState
        .map((bps) => bps.move(BookState.read, BookState.reading))
        .getOrElse(() => BooksPerStateData.empty());

    final newOs = state.otherStats
        .map((os) => os.remove(event.book))
        .getOrElse(() => OtherStatsData.empty());

    emit(
      StatsState.loaded(
        booksPerYear: newBpy,
        booksPerMonth: newBpm,
        booksPerState: newBps,
        otherStats: newOs,
      ),
    );
  }

  Future<void> _onBookStarted(
    BookStarted event,
    Emitter<StatsState> emit,
  ) async {
    final newBps = state.booksPerState
        .getOrElse(() => BooksPerStateData.empty())
        .move(BookState.read, BookState.reading);

    emit(
      StatsState.loaded(
        booksPerYear: state.booksPerYear.toNullable()!,
        booksPerMonth: state.booksPerMonth.toNullable()!,
        booksPerState: newBps,
        otherStats: state.otherStats.toNullable()!,
      ),
    );
  }

  Future<void> _onBookUnstarted(
    BookUnstarted event,
    Emitter<StatsState> emit,
  ) async {
    final newBps = state.booksPerState
        .getOrElse(() => BooksPerStateData.empty())
        .move(BookState.reading, BookState.read);

    emit(
      StatsState.loaded(
        booksPerYear: state.booksPerYear.toNullable()!,
        booksPerMonth: state.booksPerMonth.toNullable()!,
        booksPerState: newBps,
        otherStats: state.otherStats.toNullable()!,
      ),
    );
  }
}
