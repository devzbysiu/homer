import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../features/book_summary/domain/entities/local_book.dart';
import '../../../features/books_listing/presentation/bloc/books_bloc.dart';
import '../../../features/search/domain/entities/remote_book.dart';
import '../../../features/tags_manager/domain/entities/tag.dart';

extension BooksContextExt on BuildContext {
  void addBook(RemoteBook book, LocalBookState state, Set<Tag> tags) {
    _emitBooksEvt(BookAdded(book, state, tags));
  }

  void bookSwipedRight(LocalBook book) {
    _emitBooksEvt(BookSwipedRight(book));
  }

  void bookSwipedLeft(LocalBook book) {
    _emitBooksEvt(BookSwipedLeft(book));
  }

  void refreshBooksList() {
    _emitBooksEvt(RefreshBooksList());
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
