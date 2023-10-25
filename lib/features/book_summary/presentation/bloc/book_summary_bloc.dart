import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../domain/entities/local_book.dart';

part 'book_summary_event.dart';
part 'book_summary_state.dart';

final class BookSummaryBloc extends Bloc<BookSummaryEvent, BookSummaryState> {
  BookSummaryBloc() : super(Empty()) {
    on<ShowSummary>(_onShowSummary);
    on<SummaryModeDisabled>(_onSummaryModeDisabled);
    on<SummaryModeToggled>(_onSummaryModeToggled);
  }

  Future<void> _onShowSummary(
    ShowSummary event,
    Emitter<BookSummaryState> emit,
  ) async {
    emit(EnableSummaryMode(bookInSummaryMode: some(event.book)));
    return Future.value();
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
