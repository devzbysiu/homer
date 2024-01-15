import 'dart:async';
import 'dart:collection';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/books_per_year.dart';
import '../../domain/usecases/load_books_per_year.dart';

part 'stats_event.dart';
part 'stats_state.dart';

final class StatsBloc extends Bloc<StatsEvent, StatsState> {
  StatsBloc({required this.loadBooksPerYear}) : super(StatsState.initial()) {
    on<LoadStats>(_onLoadStats);
    add(LoadStats());
  }

  final LoadBooksPerYear loadBooksPerYear;

  Future<void> _onLoadStats(
    LoadStats event,
    Emitter<StatsState> emit,
  ) async {
    final result = await loadBooksPerYear(NoParams());
    result.when(
      (booksPerYear) => emit(StatsState.loaded(booksPerYear)),
      (_) => emit(state),
    );
  }
}

extension StatsContextExt on BuildContext {}
