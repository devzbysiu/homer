import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/repository/books_repository.dart';
import 'package:meta/meta.dart';

part 'books_event.dart';
part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc(this.booksRepo) : super(BooksState(booksRepo.findAll())) {
    on<BookAdded>(_onBookAdded);
    on<BookSwipedRight>(_onBookSwipedRight);
    on<BookSwipedLeft>(_onBookSwipedLeft);
  }

  FutureOr<void> _onBookAdded(BookAdded event, Emitter<BooksState> emit) {
    booksRepo.add(event.book);
    emit(BooksState(booksRepo.findAll()));
  }

  FutureOr<void> _onBookSwipedRight(
    BookSwipedRight event,
    Emitter<BooksState> emit,
  ) {
    booksRepo.swap(event.book, event.book.moveRight());
    emit(BooksState(booksRepo.findAll()));
  }

  FutureOr<void> _onBookSwipedLeft(
    BookSwipedLeft event,
    Emitter<BooksState> emit,
  ) {
    final book = event.book;
    booksRepo.swap(book, book.moveLeft());
    emit(BooksState(booksRepo.findAll()));
  }

  final BooksRepository booksRepo;
}