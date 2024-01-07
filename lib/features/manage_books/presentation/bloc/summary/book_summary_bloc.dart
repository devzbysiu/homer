import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/book.dart';

part 'book_summary_event.dart';
part 'book_summary_state.dart';

final class BookSummaryBloc extends Bloc<BookSummaryEvent, BookSummaryState> {
  BookSummaryBloc() : super(Empty()) {
    on<SummaryModeDisabling>(_onSummaryModeDisabling);
    on<SummaryModeToggled>(_onSummaryModeToggled);
    on<SummaryModeDisabled>(_onSummaryModeDisabled);
  }

  Future<void> _onSummaryModeDisabling(
    SummaryModeDisabling event,
    Emitter<BookSummaryState> emit,
  ) async {
    emit(DisablingSummaryMode(wasInSummaryMode: state.bookInSummaryMode));
  }

  Future<void> _onSummaryModeToggled(
    SummaryModeToggled event,
    Emitter<BookSummaryState> emit,
  ) async {
    state.bookInSummaryMode.fold(
      () => emit(EnableSummaryMode(bookInSummaryMode: some(event.book))),
      (book) => emit(DisablingSummaryMode(
        wasInSummaryMode: state.bookInSummaryMode,
      )),
    );
  }

  Future<void> _onSummaryModeDisabled(
    SummaryModeDisabled event,
    Emitter<BookSummaryState> emit,
  ) async {
    emit(DisabledSummaryMode());
  }
}

extension BookSummaryContextExt on BuildContext {
  void toggleSummaryMode(Book book) {
    _emitBookEvt(SummaryModeToggled(book));
  }

  void disableSummaryMode() {
    _emitBookEvt(SummaryModeDisabling());
  }

  void summaryModeDisabled() {
    _emitBookEvt(SummaryModeDisabled());
  }

  void _emitBookEvt(BookSummaryEvent event) {
    read<BookSummaryBloc>().add(event);
  }
}
