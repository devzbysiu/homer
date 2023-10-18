import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/search/domain/entities/remote_book.dart';
import '../../../features/search/presentation/bloc/book_search_bloc.dart';

extension BookSearchContextExt on BuildContext {
  bool isSearchInProgress() {
    return select((BookSearchBloc bloc) => bloc.state.searchInProgress);
  }

  Option<RemoteBook> pickedBook() {
    return select((BookSearchBloc bloc) => bloc.state.pickedBook);
  }

  void clearPickedBook() {
    _emitSearchForBooksEvt(ClearPickedBook());
  }

  void initiateSearch(String query) {
    _emitSearchForBooksEvt(SearchInitiated(query));
  }

  void pickSuggestedBook(RemoteBook book) {
    _emitSearchForBooksEvt(SuggestedBookPicked(book));
  }

  List<RemoteBook> foundBooks() {
    return select((BookSearchBloc bloc) => bloc.state.foundBooks);
  }

  void _emitSearchForBooksEvt(SearchForBooksEvent event) {
    read<BookSearchBloc>().add(event);
  }
}
