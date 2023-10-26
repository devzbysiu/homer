import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/local_book.dart';

part 'book_summary_event.dart';
part 'book_summary_state.dart';

final class BookSummaryBloc extends Bloc<BookSummaryEvent, BookSummaryState> {
  BookSummaryBloc() : super(Empty()) {
    on<SummaryModeDisabled>(_onSummaryModeDisabled);
    on<SummaryModeToggled>(_onSummaryModeToggled);
  }

  Future<void> _onSummaryModeDisabled(
    SummaryModeDisabled event,
    Emitter<BookSummaryState> emit,
  ) async {
    emit(DisableSummaryMode());
    return Future.value();
  }

  Future<void> _onSummaryModeToggled(
    SummaryModeToggled event,
    Emitter<BookSummaryState> emit,
  ) async {
    state.bookInSummaryMode.fold(
      () => emit(EnableSummaryMode(bookInSummaryMode: some(event.book))),
      (book) => emit(DisableSummaryMode()),
    );
    return Future.value();
  }
}

extension BookSummaryContextExt on BuildContext {
  void toggleSummaryMode(LocalBook book) {
    _emitBookEvt(SummaryModeToggled(book));
  }

  void disableSummaryMode() {
    _emitBookEvt(SummaryModeDisabled());
  }

  void _emitBookEvt(BookSummaryEvent event) {
    read<BookSummaryBloc>().add(event);
  }
}
