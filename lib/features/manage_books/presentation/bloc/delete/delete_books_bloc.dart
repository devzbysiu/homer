import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/book.dart';
import '../../../../../core/orchestrator/bus.dart';
import '../../../../../core/orchestrator/events.dart';
import '../../../domain/usecases/delete_books.dart';
import 'delete_books_event.dart';
import 'delete_books_state.dart';

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
    final List<Book> current = state.deletionListOrEmpty;

    final updated = [...current];
    if (updated.contains(event.book)) {
      updated.remove(event.book);
    } else {
      updated.add(event.book);
    }

    emit(DeleteBooksState.deletionList(updated));
  }

  Future<void> _onDeleteBooks(
    DeletePickedBooks event,
    Emitter<DeleteBooksState> emit,
  ) async {
    final List<Book> toDelete = state.deletionListOrEmpty;

    if (toDelete.isEmpty) return;

    final result = await deleteBooks(DeleteParams(books: List.of(toDelete)));

    result.when((_) {
      emit(const DeleteBooksState.booksRemoved());
      eventBus.fire($DeleteBooksFinished());
    }, (error) => emit(const DeleteBooksState.deletionFailed()));
  }

  Future<void> _onClearDeletionList(
    ClearDeletionList event,
    Emitter<DeleteBooksState> emit,
  ) async {
    emit(const DeleteBooksState.deletionListCleared());
  }
}
