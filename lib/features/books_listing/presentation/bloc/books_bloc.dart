import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/features/books_listing/domain/usecases/add_book.dart';
import 'package:homer/features/books_listing/domain/usecases/list_books.dart';
import 'package:homer/features/books_listing/domain/usecases/update_book_state.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../domain/entities/book_entity.dart';

part 'books_event.dart';

part 'books_state.dart';

final class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({
    required this.addBook,
    required this.listBooks,
    required this.updateBookState,
    required this.eventBus,
  }) : super(const Empty()) {
    on<BooksListLoaded>(_onBooksListLoaded);
    on<BookAdded>(_onBookAdded);
    on<BookSwipedRight>(_onBookSwipedRight);
    on<BookSwipedLeft>(_onBookSwipedLeft);
    add(BooksListLoaded());
  }

  Future<void> _onBooksListLoaded(
    BooksListLoaded event,
    Emitter<BooksState> emit,
  ) async {
    final res = await listBooks(NoParams());
    res.when(
          (success) => emit(BooksLoaded(success)),
          (error) => emit(const FailedToLoadBooks()),
    );
  }

  Future<void> _onBookAdded(BookAdded event, Emitter<BooksState> emit) async {
    await addBook(AddParams(book: event.book));
    eventBus.fire(BookSaved());
    final res = await listBooks(NoParams());
    res.when(
      (success) => emit(BooksLoaded(success)),
      (error) => emit(const FailedToLoadBooks()),
    );
  }

  Future<void> _onBookSwipedRight(
    BookSwipedRight event,
    Emitter<BooksState> emit,
  ) async {
    final book = event.book;
    await updateBookState(UpdateParams(book: book, withCopy: book.moveRight()));
    final res = await listBooks(NoParams());
    res.when(
      (success) => emit(BooksLoaded(success)),
      (error) => emit(const FailedToLoadBooks()),
    );
  }

  Future<void> _onBookSwipedLeft(
    BookSwipedLeft event,
    Emitter<BooksState> emit,
  ) async {
    final book = event.book;
    await updateBookState(UpdateParams(book: book, withCopy: book.moveLeft()));
    final res = await listBooks(NoParams());
    res.when(
      (success) => emit(BooksLoaded(success)),
      (error) => emit(const FailedToLoadBooks()),
    );
  }

  final AddBook addBook;

  final ListBooks listBooks;

  final UpdateBookState updateBookState;

  final EventBus eventBus;
}
