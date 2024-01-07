import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/book.dart';
import '../../../domain/usecases/search_for_books.dart';

part 'book_search_event.dart';
part 'book_search_state.dart';

final class BookSearchBloc extends Bloc<BookSearchEvent, BookSearchState> {
  BookSearchBloc({required this.searchForBooks})
      : super(const BookSearchState.initial()) {
    on<SearchInitiated>(_onSearchInitiated);
  }

  final SearchForBooks searchForBooks;

  Future<void> _onSearchInitiated(
    SearchInitiated event,
    Emitter<BookSearchState> emit,
  ) async {
    if (event.query.isEmpty) {
      emit(const BookSearchState.searchFinished());
      return;
    }
    emit(const BookSearchState.searching());
    final searchResult = await searchForBooks(SearchParams(query: event.query));
    searchResult.when(
      (fb) => emit(BookSearchState.searchFinished(foundBooks: fb)),
      (error) => emit(const BookSearchState.searchFailed()),
    );
  }
}

extension BookSearchContextExt on BuildContext {
  void initiateSearch(String query) {
    _emitSearchForBooksEvt(SearchInitiated(query));
  }

  void _emitSearchForBooksEvt(BookSearchEvent event) {
    read<BookSearchBloc>().add(event);
  }
}
