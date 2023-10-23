import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../domain/entities/remote_book.dart';
import '../../domain/usecases/search_for_books.dart';

part 'book_search_event.dart';
part 'book_search_state.dart';

final class BookSearchBloc extends Bloc<BookSearchEvent, BookSearchState> {
  BookSearchBloc({required this.searchForBooks}) : super(Empty()) {
    on<SearchInitiated>(_onSearchInitiated);
    on<SuggestedBookPicked>(_onSuggestedBookPicked);
    on<ClearPickedBook>(_onClearPickedBook);
  }

  final SearchForBooks searchForBooks;

  Future<void> _onSearchInitiated(
    SearchInitiated event,
    Emitter<BookSearchState> emit,
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
    Emitter<BookSearchState> emit,
  ) async {
    emit(BookPicked(pickedBook: optionOf(event.pickedBook)));
    return Future.value();
  }

  Future<void> _onClearPickedBook(
    ClearPickedBook event,
    Emitter<BookSearchState> emit,
  ) async {
    emit(NoPickedBook());
    return Future.value();
  }
}
