import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/usecase/usecase.dart';
import '../../../../find_new_book/domain/entities/remote_book.dart';
import '../../../../tags_manager/domain/entities/tag.dart';
import '../../../domain/entities/local_book.dart';
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
  }) : super(Empty()) {
    on<RefreshBooksList>(_onRefreshBooksList);
    on<BookAdded>(_onBookAdded);
    on<BookSwipedRight>(_onBookSwipedRight);
    on<BookSwipedLeft>(_onBookSwipedLeft);
    on<TagToggled>(_onTagToggled);
    on<BooksFiltered>(_onBooksFiltered);
    add(RefreshBooksList());
  }

  final AddBook addBook;

  final ListBooks listBooks;

  final UpdateBook updateBook;

  final FilterBooks filterBooks;

  Future<void> _onRefreshBooksList(
    RefreshBooksList event,
    Emitter<BooksState> emit,
  ) async {
    await _emitSavedBooks(emit);
    return Future.value();
  }

  Future<void> _emitSavedBooks(Emitter<BooksState> emit) async {
    final res = await listBooks(NoParams());
    res.when(
      (books) => emit(BooksLoaded(books: books)),
      (error) => emit(FailedToLoadBooks()),
    );
    return Future.value();
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

  Future<void> _onBooksFiltered(
    BooksFiltered event,
    Emitter<BooksState> emit,
  ) async {
    final res = await filterBooks(FilterParams(query: event.query));
    res.when(
      (success) => emit(BooksLoaded(books: success)),
      (error) => emit(FailedToLoadBooks()),
    );
    return Future.value();
  }
}

extension BooksContextExt on BuildContext {
  void addBook(RemoteBook book, LocalBookState state, Set<Tag> tags) {
    _emitBooksEvt(BookAdded(book, state, tags));
  }

  void bookSwipedRight(LocalBook book) {
    _emitBooksEvt(BookSwipedRight(book));
  }

  void bookSwipedLeft(LocalBook book) {
    _emitBooksEvt(BookSwipedLeft(book));
  }

  void refreshBooksList() {
    _emitBooksEvt(RefreshBooksList());
  }

  void toggleTag(LocalBook book, Tag tag) {
    _emitBooksEvt(TagToggled(book, tag));
  }

  void filterBooks(String query) {
    _emitBooksEvt(BooksFiltered(query));
  }

  void _emitBooksEvt(BooksEvent event) {
    read<BooksBloc>().add(event);
  }
}
