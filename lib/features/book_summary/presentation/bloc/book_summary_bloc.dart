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
  }

  Future<void> _onShowSummary(
    ShowSummary event,
    Emitter<BookSummaryState> emit,
  ) async {
    emit(EnableSummaryMode(book: some(event.book)));
  }

  Future<void> _onSummaryModeDisabled(
    SummaryModeDisabled event,
    Emitter<BookSummaryState> emit,
  ) async {
    emit(DisableSummaryMode());
  }
}
