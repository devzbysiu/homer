import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/usecases/search_and_check_saved.dart';
import 'book_search_event.dart';
import 'book_search_state.dart';

final class BookSearchBloc extends Bloc<SearchEvent, BookSearchState> {
  BookSearchBloc({required this.searchForBooks})
    : super(BookSearchState.initial()) {
    on<Searching>(_onSearching);
    on<ShareOffloaded>(_onShareOffloaded);
    on<ResetShareOffload>(_onResetShareOffload);
    on<SuggestionPicked>(_onSuggestedBookPicked);
    on<ClearPickedBook>(_onClearPickedBook);
  }

  final SearchForBooks searchForBooks;

  Future<void> _onSearching(
    Searching event,
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

  Future<void> _onShareOffloaded(
    ShareOffloaded event,
    Emitter<BookSearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(state.shareOffloadFinished([]));
      return;
    }
    emit(state.searching());
    final searchResult = await searchForBooks(SearchParams(query: event.query));
    searchResult.when(
      (books) => emit(state.shareOffloadFinished(books)),
      (error) => emit(state.searchFailed(error.userMessage())),
    );
  }

  Future<void> _onResetShareOffload(
    ResetShareOffload event,
    Emitter<BookSearchState> emit,
  ) async {
    emit(state.resetShareOffload());
  }

  void _onSuggestedBookPicked(
    SuggestionPicked event,
    Emitter<BookSearchState> emit,
  ) {
    emit(state.picked(event.pickedBook));
  }

  void _onClearPickedBook(
    ClearPickedBook event,
    Emitter<BookSearchState> emit,
  ) {
    emit(state.noPickedBook());
  }
}
