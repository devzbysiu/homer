import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/search/domain/entities/remote_book.dart';
import '../../../features/search/presentation/bloc/book_search_bloc.dart';

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
