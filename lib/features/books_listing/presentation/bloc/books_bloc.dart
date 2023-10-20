import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// ignore: depend_on_referenced_packages
import 'package:meta/meta.dart';

import '../../../../core/usecase/usecase.dart';
import '../../../book/domain/entities/local_book.dart';
import '../../../search/domain/entities/remote_book.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import '../../domain/usecases/add_book.dart';
import '../../domain/usecases/delete_picked_books.dart';
import '../../domain/usecases/filter_books.dart';
import '../../domain/usecases/list_books.dart';
import '../../domain/usecases/update_book.dart';

part 'books_event.dart';
part 'books_state.dart';

final class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({
    required this.addBook,
    required this.listBooks,
    required this.updateBook,
    required this.deleteBooks,
    required this.filterBooks,
  }) : super(const Empty()) {
    on<RefreshBooksList>(_onBooksListDisplayed);
    on<BookAdded>(_onBookAdded);
    on<BookSwipedRight>(_onBookSwipedRight);
    on<BookSwipedLeft>(_onBookSwipedLeft);
    on<AppendToDeleteList>(_onAppendToDeleteList);
    on<RemoveFromDeleteList>(_onRemoveFromDeleteList);
    on<DeleteBooks>(_onDeleteBooks);
    on<ClearDeletionList>(_onClearDeletionList);
    on<TagToggled>(_onTagToggled);
    on<BooksFiltered>(_onFilterBooks);
    add(RefreshBooksList());
  }

  final AddBook addBook;

  final ListBooks listBooks;

  final UpdateBook updateBook;

  final DeletePickedBooks deleteBooks;

  final FilterBooks filterBooks;

  Future<void> _onBooksListDisplayed(
    RefreshBooksList event,
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
    await addBook(AddParams(
      remoteBook: event.book,
      bookState: event.bookState,
      selectedTags: event.selectedTags,
    ));
    await _emitSavedBooks(emit);
    return Future.value();
  }

  Future<void> _onBookSwipedRight(
    BookSwipedRight event,
    Emitter<BooksState> emit,
  ) async {
    await updateBook(UpdateParams(modified: event.book.moveRight()));
    await _emitSavedBooks(emit);
    return Future.value();
  }

  Future<void> _onBookSwipedLeft(
    BookSwipedLeft event,
    Emitter<BooksState> emit,
  ) async {
    await updateBook(UpdateParams(modified: event.book.moveLeft()));
    await _emitSavedBooks(emit);
    return Future.value();
  }

  Future<void> _onAppendToDeleteList(
    AppendToDeleteList event,
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

  Future<void> _onRemoveFromDeleteList(
    RemoveFromDeleteList event,
    Emitter<BooksState> emit,
  ) async {
    emit(DeletionList(
      books: state.books,
      deleteList: List.of(state.deleteList)..remove(event.book),
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

  Future<void> _onTagToggled(
    TagToggled event,
    Emitter<BooksState> emit,
  ) async {
    final book = event.book;
    final tags = Set.of(book.tags);
    final toggledTag = event.tag;
    if (!tags.remove(toggledTag)) {
      // Tag was not removed so it wasn't in the set,
      // which means we need to add it (because it's
      // a toggle action)
      tags.add(toggledTag);
    }
    final modifiedBook = book.copyWith(tags: tags);
    await updateBook(UpdateParams(modified: modifiedBook));
    await _emitSavedBooks(emit);
    return Future.value();
  }

  Future<void> _onFilterBooks(
    BooksFiltered event,
    Emitter<BooksState> emit,
  ) async {
    await _emitFilteredBooks(emit, event.query);
  }

  Future<void> _emitFilteredBooks(
    Emitter<BooksState> emit,
    String query,
  ) async {
    final res = await filterBooks(FilterParams(query: query));
    res.when(
      (success) => emit(BooksLoaded(books: success, deleteList: const [])),
      (error) => emit(const FailedToLoadBooks()),
    );
  }
}
