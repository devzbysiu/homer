import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'book_summary_event.dart';
import 'book_summary_state.dart';

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
