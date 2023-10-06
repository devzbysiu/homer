import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/book.dart';
import '../../domain/usecases/add_book.dart';
import '../../domain/usecases/delete_picked_books.dart';
import '../../domain/usecases/list_books.dart';
import '../../domain/usecases/update_book_state.dart';

part 'books_event.dart';

part 'books_state.dart';

final class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({
    required this.addBook,
    required this.listBooks,
    required this.updateBookState,
    required this.deleteBooks,
  }) : super(const Empty()) {
    on<BooksListDisplayed>(_onBooksListDisplayed);
    on<BookAdded>(_onBookAdded);
    on<BookSwipedRight>(_onBookSwipedRight);
    on<BookSwipedLeft>(_onBookSwipedLeft);
    on<ToggleDeletionMode>(_onToggleDeletionMode);
    on<DeleteBooks>(_onDeleteBooks);
    on<ClearDeletionList>(_onClearDeletionList);
    add(BooksListDisplayed());
  }

  final AddBook addBook;

  final ListBooks listBooks;

  final UpdateBookState updateBookState;

  final DeletePickedBooks deleteBooks;

  Future<void> _onBooksListDisplayed(
    BooksListDisplayed event,
    Emitter<BooksState> emit,
  ) async {
    await _emitSavedBooks(emit);
  }

  Future<void> _emitSavedBooks(Emitter<BooksState> emit) async {
    final res = await listBooks(NoParams());
    res.when(
      (success) => emit(BooksLoaded(books: success, deleteList: const [])),
      (error) => emit(const FailedToLoadBooks()),
    );
  }

  Future<void> _onBookAdded(
    BookAdded event,
    Emitter<BooksState> emit,
  ) async {
    await addBook(AddParams(book: event.book));
    await _emitSavedBooks(emit);
    return Future.value();
  }

  Future<void> _onBookSwipedRight(
    BookSwipedRight event,
    Emitter<BooksState> emit,
  ) async {
    await updateBookState(UpdateParams(modified: event.book.moveRight()));
    await _emitSavedBooks(emit);
    return Future.value();
  }

  Future<void> _onBookSwipedLeft(
    BookSwipedLeft event,
    Emitter<BooksState> emit,
  ) async {
    await updateBookState(UpdateParams(modified: event.book.moveLeft()));
    await _emitSavedBooks(emit);
    return Future.value();
  }

  Future<void> _onToggleDeletionMode(
    ToggleDeletionMode event,
    Emitter<BooksState> emit,
  ) async {
    if (state.deleteList.contains(event.book)) {
      _emitCleanDeletionList(emit);
      return Future.value();
    }
    emit(DeletionList(
      books: state.books,
      deleteList: List.of(state.deleteList)..add(event.book),
    ));
    return Future.value();
  }

  void _emitCleanDeletionList(Emitter<BooksState> emit) {
    emit(DeletionList(books: state.books, deleteList: const []));
  }

  Future<void> _onDeleteBooks(
    DeleteBooks event,
    Emitter<BooksState> emit,
  ) async {
    await deleteBooks(DeleteParams(books: event.books));
    final res = await listBooks(NoParams());
    res.when(
      (success) => emit(DeletionList(books: success, deleteList: const [])),
      (error) => emit(const FailedToLoadBooks()),
    );
    return Future.value();
  }

  Future<void> _onClearDeletionList(
    ClearDeletionList event,
    Emitter<BooksState> emit,
  ) async {
    _emitCleanDeletionList(emit);
    return Future.value();
  }
}
