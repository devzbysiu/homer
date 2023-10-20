import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/book/domain/entities/local_book.dart';
import '../../../features/books_listing/presentation/bloc/books_bloc.dart';
import '../../../features/search/domain/entities/remote_book.dart';
import '../../../features/tags_manager/domain/entities/tag.dart';
import 'app_tab_context_ext.dart';

extension BooksContextExt on BuildContext {
  List<LocalBook> booksOfCurrentTab() {
    return select(_books).where((b) => _belongsToCurrentTab(b)).toList();
  }

  bool _belongsToCurrentTab(LocalBook book) {
    return book.state.name == currentTab().name;
  }

  void addBook(RemoteBook book, LocalBookState state, Set<Tag> tags) {
    _emitBooksEvt(BookAdded(book, state, tags));
  }

  void appendToDeleteList(LocalBook book) {
    _emitBooksEvt(AppendToDeleteList(book));
  }

  void removeFromDeleteList(LocalBook book) {
    _emitBooksEvt(RemoveFromDeleteList(book));
  }

  void clearDeletionList() {
    _emitBooksEvt(ClearDeletionList());
  }

  void bookSwipedRight(LocalBook book) {
    _emitBooksEvt(BookSwipedRight(book));
  }

  void bookSwipedLeft(LocalBook book) {
    _emitBooksEvt(BookSwipedLeft(book));
  }

  void deleteBooks(List<LocalBook> books) {
    _emitBooksEvt(DeleteBooks(books));
  }

  void refreshBooksList() {
    _emitBooksEvt(RefreshBooksList());
  }

  List<LocalBook> booksToDelete() {
    return select((BooksBloc bloc) => bloc.state.deleteList);
  }

  void toggleTag(LocalBook book, Tag tag) {
    _emitBooksEvt(TagToggled(book, tag));
  }

  void filterBooks(String query) {
    _emitBooksEvt(BooksFiltered(query));
  }

  void _emitBooksEvt(BooksEvent event) {
    read<BooksBloc>().add(event);
  }
}

List<LocalBook> _books(BooksBloc bloc) {
  return bloc.state.books;
}
