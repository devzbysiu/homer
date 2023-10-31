import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/entities/local_book.dart';
import '../../../domain/usecases/delete_books.dart';

part 'delete_books_event.dart';
part 'delete_books_state.dart';

final class DeleteBooksBloc extends Bloc<DeleteBooksEvent, DeleteBooksState> {
  DeleteBooksBloc({required this.deleteBooks}) : super(Empty()) {
    on<ToggleBookOnDeleteList>(_onToggleBookOnDeleteList);
    on<DeletePickedBooks>(_onDeleteBooks);
    on<ClearDeletionList>(_onClearDeletionList);
  }

  final DeleteBooks deleteBooks;

  Future<void> _onDeleteBooks(
    DeletePickedBooks event,
    Emitter<DeleteBooksState> emit,
  ) async {
    await deleteBooks(DeleteParams(books: List.of(state.deletionList)));
    emit(BooksRemoved());
    return Future.value();
  }

  Future<void> _onClearDeletionList(
    ClearDeletionList event,
    Emitter<DeleteBooksState> emit,
  ) async {
    emit(CleanDeletionList());
    return Future.value();
  }

  Future<void> _onToggleBookOnDeleteList(
    ToggleBookOnDeleteList event,
    Emitter<DeleteBooksState> emit,
  ) async {
    if (state.deletionList.contains(event.book)) {
      emit(DeletionList(
        deletionList: List.of(state.deletionList)..remove(event.book),
      ));
      return Future.value();
    }
    emit(DeletionList(
      deletionList: List.of(state.deletionList)..add(event.book),
    ));
    return Future.value();
  }
}

extension BooksContextExt on BuildContext {
  void clearDeletionList() {
    _emitDeleteBooksEvt(ClearDeletionList());
  }

  void deletePickedBooks() {
    _emitDeleteBooksEvt(DeletePickedBooks());
  }

  void toggleBookOnDeleteList(LocalBook book) {
    _emitDeleteBooksEvt(ToggleBookOnDeleteList(book));
  }

  void _emitDeleteBooksEvt(DeleteBooksEvent event) {
    read<DeleteBooksBloc>().add(event);
  }
}
