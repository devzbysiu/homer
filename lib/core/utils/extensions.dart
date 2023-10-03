import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../book/domain/entity/book_entity.dart';
import '../book/domain/entity/tag_entity.dart';
import '../book/domain/use_case/change_active_tab/app_tab_bloc.dart';
import '../book/domain/use_case/change_book_tags/book_tags_bloc.dart';
import '../book/domain/use_case/display_suggested_book/suggested_book_bloc.dart';
import '../book/domain/use_case/list_books/books_bloc.dart';
import '../book/domain/use_case/list_tags/tags_bloc.dart';
import '../book/domain/use_case/search_for_books/search_for_books_bloc.dart';

extension ContextColorExt on BuildContext {
  Color figureOutColor() {
    switch (currentTab()) {
      case AppTab.readLater:
        return Colors.green;
      case AppTab.reading:
        return Colors.blue;
      case AppTab.read:
        return Colors.amber;
    }
  }
}

extension BlocExt on BuildContext {
  AppTab currentTab() {
    return select((AppTabBloc bloc) => bloc.state.currentTab);
  }

  List<BookEntity> booksOfCurrentTab() {
    return select(_books).where((b) => _belongsToCurrentTab(b)).toList();
  }

  bool _belongsToCurrentTab(BookEntity book) {
    return book.state.name == currentTab().name;
  }

  void emitBooksEvt(BooksEvent event) {
    read<BooksBloc>().add(event);
  }

  BookEntity? pickedSuggestedBook() {
    return select((SuggestedBookBloc bloc) => bloc.state.pickedBook);
  }

  void emitSuggestedBookEvt(SuggestedBookEvent event) {
    read<SuggestedBookBloc>().add(event);
  }

  List<BookEntity> foundBooks() {
    return select((SearchForBooksBloc bloc) => bloc.state.foundBooks);
  }

  void emitSearchForBooksEvt(SearchForBooksEvent event) {
    read<SearchForBooksBloc>().add(event);
  }

  List<TagEntity> allTags() {
    return select((TagsBloc bloc) => bloc.state.tags);
  }

  void emitBookTagsEvt(BookTagsEvent event) {
    read<BookTagsBloc>().add(event);
  }

  Set<TagEntity> selectedTags() {
    return read<BookTagsBloc>().state.selectedTags;
  }
}

List<BookEntity> _books(BooksBloc bloc) {
  return bloc.state.books;
}
