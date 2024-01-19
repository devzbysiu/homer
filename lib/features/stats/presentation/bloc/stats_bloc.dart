import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/books_per_month_data.dart';
import '../../domain/entities/books_per_year_data.dart';
import '../../domain/usecases/load_books_per_month.dart';
import '../../domain/usecases/load_books_per_year.dart';

part 'stats_event.dart';
part 'stats_state.dart';

final class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc({
    required this.loadBooksPerYear,
    required this.loadBooksPerMonth,
  }) : super(const StatsState.initial()) {
    on<LoadStats>(_onLoadStats);
    on<BookFinished>(_onBookFinished);
    on<BookUnfinished>(_onBookUnfinished);
  }

  final LoadBooksPerYear loadBooksPerYear;

  final LoadBooksPerMonth loadBooksPerMonth;

  Future<void> _onLoadStats(
    LoadStats event,
    Emitter<StatsState> emit,
  ) async {
    final bpy = await loadBooksPerYear(NoParams());
    final bpm = await loadBooksPerMonth(NoParams());

    if (bpy.isError() || bpm.isError()) {
      return emit(const StatsState.loadFailed());
    }

    final booksPerYear = bpy.tryGetSuccess()!;
    final booksPerMonth = bpm.tryGetSuccess()!;
    emit(StatsState.loaded(some(booksPerYear), some(booksPerMonth)));
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

    emit(StatsState.loaded(some(newBpy), some(newBpm)));
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

    emit(StatsState.loaded(some(newBpy), some(newBpm)));
  }
}

extension StatsContextExt on BuildContext {
  void bookFinished(Book book) => read<StatsBloc>().add(BookFinished(book));
  void undoFinished(Book book) => read<StatsBloc>().add(BookUnfinished(book));
}
