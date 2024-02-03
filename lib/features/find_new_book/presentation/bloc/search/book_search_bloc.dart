import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/book.dart';
import '../../../../../core/orchestrator/events.dart';
import '../../../domain/usecases/search_and_check_saved.dart';

part 'book_search_event.dart';
part 'book_search_state.dart';

final class BookSearchBloc extends Bloc<BookSearchEvent, BookSearchState> {
  BookSearchBloc({required this.searchForBooks})
      : super(const BookSearchState.initial()) {
    on<SearchStarted>(_onSearchInitiated);
    on<SuggestionPicked>(_onSuggestedBookPicked);
    on<ClearPickedBook>(_onClearPickedBook);
  }

  final SearchForBooks searchForBooks;

  Future<void> _onSearchInitiated(
    SearchStarted event,
    Emitter<BookSearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(state.searchFinished([]));
      return;
    }
    emit(state.searching());
    final searchResult = await searchForBooks(SearchParams(query: event.query));
    searchResult.when(
      (books) => emit(state.searchFinished(books)),
      (error) => emit(state.searchFailed(error.userMessage())),
    );
  }

  void _onSuggestedBookPicked(
    SuggestionPicked event,
    Emitter<BookSearchState> emit,
  ) {
    emit(BookSearchState.picked(some(event.pickedBook)));
  }

  void _onClearPickedBook(
    ClearPickedBook event,
    Emitter<BookSearchState> emit,
  ) {
    emit(const BookSearchState.noPickedBook());
  }
}
