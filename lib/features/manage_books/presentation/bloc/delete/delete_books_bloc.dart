import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/book.dart';
import '../../../../../core/orchestrator/bus.dart';
import '../../../../../core/orchestrator/events.dart';
import '../../../domain/usecases/delete_books.dart';

part 'delete_books_event.dart';
part 'delete_books_state.dart';

final class DeleteBooksBloc extends Bloc<DeleteBooksEvent, DeleteBooksState> {
  DeleteBooksBloc({required this.eventBus, required this.deleteBooks})
    : super(const DeleteBooksState.initial()) {
    on<DeleteModeToggled>(_onToggleBookOnDeleteList);
    on<DeletePickedBooks>(_onDeleteBooks);
    on<ClearDeletionList>(_onClearDeletionList);
  }

  final Bus eventBus;

  final DeleteBooks deleteBooks;

  Future<void> _onToggleBookOnDeleteList(
    DeleteModeToggled event,
    Emitter<DeleteBooksState> emit,
  ) async {
    if (state.deletionList.contains(event.book)) {
      emit(
        DeleteBooksState.deletionList(
          List.of(state.deletionList)..remove(event.book),
        ),
      );
      return;
    }
    emit(
      DeleteBooksState.deletionList(
        List.of(state.deletionList)..add(event.book),
      ),
    );
  }

  Future<void> _onDeleteBooks(
    DeletePickedBooks event,
    Emitter<DeleteBooksState> emit,
  ) async {
    if (state.deletionList.isEmpty) return;
    final result = await deleteBooks(
      DeleteParams(books: List.of(state.deletionList)),
    );
    result.when((_) {
      emit(const DeleteBooksState.booksRemoved());
      eventBus.fire(DeleteBooksFinished());
    }, (error) => emit(const DeleteBooksState.deletionFailed()));
  }

  Future<void> _onClearDeletionList(
    ClearDeletionList event,
    Emitter<DeleteBooksState> emit,
  ) async {
    emit(const DeleteBooksState.deletionListCleared());
  }
}
