import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/use_case/app_tab/app_tab_bloc.dart';
import 'package:homer/core/book/domain/use_case/books/books_bloc.dart';

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
}

List<BookEntity> _books(BooksBloc bloc) {
  return bloc.state.books;
}