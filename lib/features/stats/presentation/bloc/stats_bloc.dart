import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/books_per_year.dart';
import '../../domain/usecases/load_books_per_year.dart';

part 'stats_event.dart';
part 'stats_state.dart';

final class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc({required this.loadBooksPerYear})
      : super(const StatsState.initial()) {
    on<LoadStats>(_onLoadStats);
    on<BookFinished>(_onBookFinished);
    add(LoadStats());
  }

  final LoadBooksPerYear loadBooksPerYear;

  Future<void> _onLoadStats(
    LoadStats event,
    Emitter<StatsState> emit,
  ) async {
    final result = await loadBooksPerYear(NoParams());
    result.when(
      (booksPerYear) => emit(StatsState.loaded(some(booksPerYear))),
      (_) => emit(const StatsState.loadFailed()),
    );
  }

  Future<void> _onBookFinished(
    BookFinished event,
    Emitter<StatsState> emit,
  ) async {
    emit(state.bookFinished(event.book));
  }
}

extension StatsContextExt on BuildContext {
  void bookFinished(Book book) => read<StatsBloc>().add(BookFinished(book));
}
