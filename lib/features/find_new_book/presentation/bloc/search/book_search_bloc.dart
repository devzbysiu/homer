import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:share_handler/share_handler.dart';

import '../../../domain/entities/remote_book.dart';
import '../../../domain/usecases/fetch_shared_book.dart';
import '../../../domain/usecases/search_for_books.dart';

part 'book_search_event.dart';
part 'book_search_state.dart';

final class BookSearchBloc extends Bloc<BookSearchEvent, BookSearchState> {
  BookSearchBloc({
    required this.shareHandler,
    required this.searchForBooks,
    required this.fetchSharedBook,
  }) : super(Empty()) {
    // This happens when user shares URL, but the app is not running.
    // TODO: Make sure it's working
    shareHandler.getInitialSharedMedia().then((media) {
      if (media?.content == null) return;
      add(BookSharedFromOutside(media!.content!));
    });

    // This happens when the app is already running.
    shareHandler.sharedMediaStream.listen((media) {
      if (media.content == null) return;
      add(BookSharedFromOutside(media.content!));
    });

    on<SearchInitiated>(_onSearchInitiated);
    on<SuggestedBookPicked>(_onSuggestedBookPicked);
    on<ClearPickedBook>(_onClearPickedBook);
    on<BookSharedFromOutside>(_onBookSharedFromOutside);
  }

  final ShareHandlerPlatform shareHandler;

  final SearchForBooks searchForBooks;

  final FetchSharedBook fetchSharedBook;

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

  Future<void> _onBookSharedFromOutside(
    BookSharedFromOutside event,
    Emitter<BookSearchState> emit,
  ) async {
    emit(FetchingSharedBookDetails());
    final sharedBook = await fetchSharedBook(SharedBookParams(url: event.url));
    sharedBook.when(
      (book) => emit(BookShared(pickedBook: optionOf(book))),
      (error) => emit(FailedToLookUpSharedBook(cause: error.userMessage())),
    );
    return Future.value();
  }
}

extension BookSearchContextExt on BuildContext {
  void clearPickedBook() {
    _emitSearchForBooksEvt(ClearPickedBook());
  }

  void initiateSearch(String query) {
    _emitSearchForBooksEvt(SearchInitiated(query));
  }

  void pickSuggestedBook(RemoteBook book) {
    _emitSearchForBooksEvt(SuggestedBookPicked(book));
  }

  void _emitSearchForBooksEvt(BookSearchEvent event) {
    read<BookSearchBloc>().add(event);
  }
}
