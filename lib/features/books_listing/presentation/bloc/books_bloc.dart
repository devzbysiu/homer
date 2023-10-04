import 'dart:async';

import 'package:event_bus/event_bus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../domain/entities/book_entity.dart';
import '../../domain/repositories/books_repository.dart';

part 'books_event.dart';

part 'books_state.dart';

final class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({
    required this.booksRepo,
    required this.eventBus,
  }) : super(BooksState(booksRepo.listAll())) {
    on<BookAdded>(_onBookAdded);
    on<BookSwipedRight>(_onBookSwipedRight);
    on<BookSwipedLeft>(_onBookSwipedLeft);
  }

  Future<void> _onBookAdded(BookAdded event, Emitter<BooksState> emit) async {
    booksRepo.add(event.book);
    eventBus.fire(BookSaved());
    emit(BooksState(booksRepo.listAll()));
  }

  Future<void> _onBookSwipedRight(
    BookSwipedRight event,
    Emitter<BooksState> emit,
  ) async {
    booksRepo.swap(event.book, event.book.moveRight());
    emit(BooksState(booksRepo.listAll()));
  }

  Future<void> _onBookSwipedLeft(
    BookSwipedLeft event,
    Emitter<BooksState> emit,
  ) async {
    final book = event.book;
    booksRepo.swap(book, book.moveLeft());
    emit(BooksState(booksRepo.listAll()));
  }

  final BooksRepository booksRepo;

  final EventBus eventBus;
}
