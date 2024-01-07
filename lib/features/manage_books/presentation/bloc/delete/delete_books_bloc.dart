import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/book.dart';
import '../../../domain/usecases/delete_books.dart';

part 'delete_books_event.dart';
part 'delete_books_state.dart';

final class DeleteBooksBloc extends Bloc<DeleteBooksEvent, DeleteBooksState> {
  DeleteBooksBloc({required this.deleteBooks})
      : super(const DeleteBooksState.initial()) {
    on<ToggleBookOnDeleteList>(_onToggleBookOnDeleteList);
    on<DeletePickedBooks>(_onDeleteBooks);
    on<ClearDeletionList>(_onClearDeletionList);
  }

  final DeleteBooks deleteBooks;

  Future<void> _onToggleBookOnDeleteList(
    ToggleBookOnDeleteList event,
    Emitter<DeleteBooksState> emit,
  ) async {
    if (state.deletionList.contains(event.book)) {
      emit(DeleteBooksState.deletionList(
        List.of(state.deletionList)..remove(event.book),
      ));
      return Future.value();
    }
    emit(DeleteBooksState.deletionList(
      List.of(state.deletionList)..add(event.book),
    ));
    return Future.value();
  }

  Future<void> _onDeleteBooks(
    DeletePickedBooks event,
    Emitter<DeleteBooksState> emit,
  ) async {
    if (state.deletionList.isEmpty) {
      return Future.value();
    }
    final result = await deleteBooks(
      DeleteParams(books: List.of(state.deletionList)),
    );
    result.when(
      (_) => emit(const DeleteBooksState.booksRemoved()),
      (error) => emit(const DeleteBooksState.deletionFailed()),
    );
    return Future.value();
  }

  Future<void> _onClearDeletionList(
    ClearDeletionList event,
    Emitter<DeleteBooksState> emit,
  ) async {
    emit(const DeleteBooksState.deletionListCleared());
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

  void toggleBookOnDeleteList(Book book) {
    _emitDeleteBooksEvt(ToggleBookOnDeleteList(book));
  }

  void _emitDeleteBooksEvt(DeleteBooksEvent event) {
    read<DeleteBooksBloc>().add(event);
  }
}
