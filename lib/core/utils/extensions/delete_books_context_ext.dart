import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/features/delete_book/presentation/bloc/delete_books_bloc.dart';

import '../../../features/book_summary/domain/entities/local_book.dart';

extension BooksContextExt on BuildContext {
  void appendToDeleteList(LocalBook book) {
    _emitDeleteBooksEvt(AppendToDeleteList(book));
  }

  void removeFromDeleteList(LocalBook book) {
    _emitDeleteBooksEvt(RemoveFromDeleteList(book));
  }

  void clearDeletionList() {
    _emitDeleteBooksEvt(ClearDeletionList());
  }

  void deletePickedBooks() {
    _emitDeleteBooksEvt(DeletePickedBooks());
  }

  List<LocalBook> booksToDelete() {
    return select((DeleteBooksBloc bloc) => bloc.state.deletionList);
  }

  void _emitDeleteBooksEvt(DeleteBooksEvent event) {
    read<DeleteBooksBloc>().add(event);
  }
}
