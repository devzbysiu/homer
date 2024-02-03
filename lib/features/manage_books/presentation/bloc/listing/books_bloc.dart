import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/book.dart';
import '../../../../../core/entities/tag.dart';
import '../../../../../core/orchestrator/events.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../domain/usecases/add_book.dart';
import '../../../domain/usecases/filter_books.dart';
import '../../../domain/usecases/list_books.dart';
import '../../../domain/usecases/update_book.dart';

part 'books_event.dart';
part 'books_state.dart';

final class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({
    required this.addBook,
    required this.listBooks,
    required this.updateBook,
    required this.filterBooks,
  }) : super(const BooksState.initial()) {
    on<RefreshBooksList>(_onRefreshBooksList);
    on<SaveBook>(_onBookAdded);
    on<BookSwipedRight>(_onBookSwipedRight);
    on<BookSwipedLeft>(_onBookSwipedLeft);
    on<TagToggled>(_onTagToggled);
    on<BooksFiltered>(_onBooksFiltered);
    add(RefreshBooksList());
  }

  final AddBook addBook;

  final ListSortedBooks listBooks;

  final UpdateBook updateBook;

  final FilterBooks filterBooks;

  Future<void> _onRefreshBooksList(
    RefreshBooksList event,
    Emitter<BooksState> emit,
  ) async {
    await _emitSavedBooks(emit);
  }

  Future<void> _emitSavedBooks(Emitter<BooksState> emit) async {
    final result = await listBooks(NoParams());
    result.when(
      (books) => emit(BooksState.booksLoaded(books)),
      (error) => emit(const BooksState.loadingFailed()),
    );
  }

  Future<void> _onBookAdded(
    SaveBook event,
    Emitter<BooksState> emit,
  ) async {
    final result = await addBook(AddParams(
      book: event.book,
      bookState: event.bookState,
      selectedTags: event.selectedTags,
    ));
    await result.when(
      (success) async => await _emitSavedBooks(emit),
      (error) async => emit(const BooksState.addingBookFailed()),
    );
  }

  Future<void> _onBookSwipedRight(
    BookSwipedRight event,
    Emitter<BooksState> emit,
  ) async {
    final modifiedBook = event.book;
    final result = await updateBook(UpdateParams(modified: modifiedBook));
    await result.when(
      (success) async => await _emitSavedBooks(emit),
      (error) async => emit(const BooksState.updatingBookFailed()),
    );
  }

  Future<void> _onBookSwipedLeft(
    BookSwipedLeft event,
    Emitter<BooksState> emit,
  ) async {
    final modifiedBook = event.book;
    final result = await updateBook(UpdateParams(modified: modifiedBook));
    await result.when(
      (success) async => await _emitSavedBooks(emit),
      (error) async => emit(const BooksState.updatingBookFailed()),
    );
  }

  Future<void> _onTagToggled(
    TagToggled event,
    Emitter<BooksState> emit,
  ) async {
    final book = event.book;
    final tags = List.of(book.tags);
    final toggledTag = event.tag;
    if (!tags.remove(toggledTag)) {
      // Tag was not removed so it wasn't in the set,
      // which means we need to add it (because it's
      // a toggle action)
      tags.add(toggledTag);
    }
    final modifiedBook = book.copyWith(tags: tags);
    final result = await updateBook(UpdateParams(modified: modifiedBook));
    await result.when(
      (success) async => await _emitSavedBooks(emit),
      (error) async => emit(const BooksState.updatingBookFailed()),
    );
  }

  Future<void> _onBooksFiltered(
    BooksFiltered event,
    Emitter<BooksState> emit,
  ) async {
    final result = await filterBooks(FilterParams(query: event.query));
    result.when(
      (books) => emit(BooksState.booksLoaded(books)),
      (error) => emit(const BooksState.loadingFailed()),
    );
  }
}
