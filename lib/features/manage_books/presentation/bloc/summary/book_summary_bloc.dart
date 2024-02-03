import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/book.dart';
import '../../../../../core/orchestrator/events.dart';

part 'book_summary_event.dart';
part 'book_summary_state.dart';

final class BookSummaryBloc extends Bloc<BookSummaryEvent, BookSummaryState> {
  BookSummaryBloc() : super(const BookSummaryState.initial()) {
    on<SummaryModeClosing>(_onSummaryModeDisabling);
    on<SummaryModeToggled>(_onSummaryModeToggled);
    on<SummaryModeClosed>(_onSummaryModeDisabled);
  }

  Future<void> _onSummaryModeDisabling(
    SummaryModeClosing event,
    Emitter<BookSummaryState> emit,
  ) async {
    emit(BookSummaryState.disabling(state.current));
  }

  Future<void> _onSummaryModeToggled(
    SummaryModeToggled event,
    Emitter<BookSummaryState> emit,
  ) async {
    state.current.fold(
      () => emit(BookSummaryState.enabled(event.book)),
      (book) => emit(BookSummaryState.disabling(state.current)),
    );
  }

  Future<void> _onSummaryModeDisabled(
    SummaryModeClosed event,
    Emitter<BookSummaryState> emit,
  ) async {
    emit(const BookSummaryState.disabled());
  }
}
