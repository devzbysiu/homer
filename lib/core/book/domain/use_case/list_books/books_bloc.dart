import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/repository/books_repository.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({
    required this.booksRepo,
    required this.eventBus,
  }) : super(BooksState(booksRepo.listAll())) {
    on<BookAdded>(_onBookAdded);
    on<BookSwipedRight>(_onBookSwipedRight);
    on<BookSwipedLeft>(_onBookSwipedLeft);
  }

  FutureOr<void> _onBookAdded(BookAdded event, Emitter<BooksState> emit) {
    booksRepo.add(event.book);
    eventBus.fire(BookSaved());
    emit(BooksState(booksRepo.listAll()));
  }

  FutureOr<void> _onBookSwipedRight(
    BookSwipedRight event,
    Emitter<BooksState> emit,
  ) {
    booksRepo.swap(event.book, event.book.moveRight());
    emit(BooksState(booksRepo.listAll()));
  }

  FutureOr<void> _onBookSwipedLeft(
    BookSwipedLeft event,
    Emitter<BooksState> emit,
  ) {
    final book = event.book;
    booksRepo.swap(book, book.moveLeft());
    emit(BooksState(booksRepo.listAll()));
  }

  final BooksRepository booksRepo;

  final EventBus eventBus;
}
