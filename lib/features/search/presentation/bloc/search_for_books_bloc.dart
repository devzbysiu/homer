import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/remote_book.dart';
import '../../domain/usecases/close_search_bar.dart';
import '../../domain/usecases/search_for_books.dart';

part 'search_for_books_event.dart';

part 'search_for_books_state.dart';

final class SearchForBooksBloc
    extends Bloc<SearchForBooksEvent, SearchForBooksState> {
  SearchForBooksBloc({
    required this.searchForBooks,
    required this.closeSearchBar,
  }) : super(Empty()) {
    on<SearchInitiated>(_onSearchInitiated);
    on<SuggestedBookPicked>(_onSuggestedBookPicked);
    on<NoBookPicked>(_onClearPickedBook);
  }

  final SearchForBooks searchForBooks;

  final CloseSearchBar closeSearchBar;

  Future<void> _onSearchInitiated(
    SearchInitiated event,
    Emitter<SearchForBooksState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(ClearFoundBooks(pickedBook: state.pickedBook));
      return;
    }
    emit(SearchInProgress(pickedBook: state.pickedBook));
    final searchResult = await searchForBooks(SearchParams(query: event.query));
    searchResult.when(
      (ok) => emit(FoundBooks(pickedBook: state.pickedBook, foundBooks: ok)),
      (error) => emit(FailedToSearchBooks()),
    );
    return Future.value();
  }

  Future<void> _onSuggestedBookPicked(
    SuggestedBookPicked event,
    Emitter<SearchForBooksState> emit,
  ) async {
    emit(BookPickedState(pickedBook: optionOf(event.pickedBook)));
    closeSearchBar(NoParams());
    return Future.value();
  }

  Future<void> _onClearPickedBook(
    NoBookPicked event,
    Emitter<SearchForBooksState> emit,
  ) async {
    emit(NoPickedBook());
    return Future.value();
  }
}
