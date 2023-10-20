import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../book_summary/domain/entities/local_book.dart';
import '../../../books_listing/domain/usecases/delete_picked_books.dart';

part 'delete_books_event.dart';
part 'delete_books_state.dart';

final class DeleteBooksBloc extends Bloc<DeleteBooksEvent, DeleteBooksState> {
  DeleteBooksBloc({required this.deleteBooks}) : super(const Empty()) {
    on<AppendToDeleteList>(_onAppendToDeleteList);
    on<RemoveFromDeleteList>(_onRemoveFromDeleteList);
    on<DeleteBooks>(_onDeleteBooks);
    on<ClearDeletionList>(_onClearDeletionList);
  }

  final DeletePickedBooks deleteBooks;

  Future<void> _onAppendToDeleteList(
    AppendToDeleteList event,
    Emitter<DeleteBooksState> emit,
  ) async {
    if (state.deletionList.contains(event.book)) {
      emit(const CleanDeletionList());
      return Future.value();
    }
    emit(DeletionList(
      deletionList: List.of(state.deletionList)..add(event.book),
    ));
    return Future.value();
  }

  Future<void> _onRemoveFromDeleteList(
    RemoveFromDeleteList event,
    Emitter<DeleteBooksState> emit,
  ) async {
    emit(DeletionList(
      deletionList: List.of(state.deletionList)..remove(event.book),
    ));
    return Future.value();
  }

  Future<void> _onDeleteBooks(
    DeleteBooks event,
    Emitter<DeleteBooksState> emit,
  ) async {
    await deleteBooks(DeleteParams(books: event.books));
    emit(const BooksRemoved());
    return Future.value();
  }

  Future<void> _onClearDeletionList(
    ClearDeletionList event,
    Emitter<DeleteBooksState> emit,
  ) async {
    emit(const CleanDeletionList());
    return Future.value();
  }
}
