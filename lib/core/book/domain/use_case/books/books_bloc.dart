import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:homer/core/book/domain/entity/book_entity.dart';
import 'package:homer/core/book/domain/repository/books_repository.dart';
import 'package:homer/core/book/domain/use_case/app_tab/app_tab_bloc.dart';
import 'package:meta/meta.dart';

part 'books_event.dart';

part 'books_state.dart';

class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc(this.booksRepo) : super(BooksState(booksRepo.findAll())) {
    on<BookAdded>(_onBookAdded);
    on<BookSwipedRight>(_onBookSwipedRight);
  }

  FutureOr<void> _onBookAdded(BookAdded event, Emitter<BooksState> emit) {
    booksRepo.add(event.book);
    emit(BooksState(booksRepo.findAll()));
  }

  final BooksRepository booksRepo;

  FutureOr<void> _onBookSwipedRight(
    BookSwipedRight event,
    Emitter<BooksState> emit,
  ) {
    final book = event.book;
    final from = event.from;
    booksRepo.swap(
      book,
      book.copyWith(state: _determineNewState(Direction.right, from)),
    );
    emit(BooksState(booksRepo.findAll()));
  }

  BookState _determineNewState(Direction direction, AppTab from) {
    switch (direction) {
      case Direction.right:
        if (from == AppTab.readLater) {
          return BookState.reading;
        }
        return BookState.read;
      case Direction.left:
        if (from == AppTab.read) {
          return BookState.reading;
        }
        return BookState.readLater;
    }
  }
}

enum Direction {
  left,
  right,
}
