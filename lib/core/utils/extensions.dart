import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../features/add_new_book/presentation/bloc/book_tags_bloc.dart';
import '../../features/books_listing/domain/entities/local_book.dart';
import '../../features/books_listing/presentation/bloc/books_bloc.dart';
import '../../features/navigation/presentation/bloc/app_tab_bloc.dart';
import '../../features/search/domain/entities/remote_book.dart';
import '../../features/search/presentation/bloc/search_for_books_bloc.dart';
import '../../features/tags_manager/domain/entities/tag.dart';
import '../../features/tags_manager/presentation/bloc/tags_bloc.dart';

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

  List<LocalBook> booksOfCurrentTab() {
    return select(_books).where((b) => _belongsToCurrentTab(b)).toList();
  }

  bool _belongsToCurrentTab(LocalBook book) {
    return book.state.name == currentTab().name;
  }

  void emitBooksEvt(BooksEvent event) {
    read<BooksBloc>().add(event);
  }

  Option<RemoteBook> pickedSuggestedBook() {
    return select((SearchForBooksBloc bloc) => bloc.state.pickedBook);
  }

  List<RemoteBook> foundBooks() {
    return select((SearchForBooksBloc bloc) => bloc.state.foundBooks);
  }

  void emitSearchForBooksEvt(SearchForBooksEvent event) {
    read<SearchForBooksBloc>().add(event);
  }

  List<Tag> allTags() {
    return select((TagsBloc bloc) => bloc.state.tags);
  }

  void emitBookTagsEvt(BookTagsEvent event) {
    read<BookTagsBloc>().add(event);
  }

  Set<Tag> selectedTags() {
    return read<BookTagsBloc>().state.selectedTags;
  }

  void emitAppTabEvt(AppTabEvent event) {
    read<AppTabBloc>().add(event);
  }

  List<LocalBook> booksToDelete() {
    return select((BooksBloc bloc) => bloc.state.deleteList);
  }
}

List<LocalBook> _books(BooksBloc bloc) {
  return bloc.state.books;
}
