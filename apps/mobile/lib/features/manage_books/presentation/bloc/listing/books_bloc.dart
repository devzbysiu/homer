import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/entities/book.dart';
import '../../../../../core/orchestrator/bus.dart';
import '../../../../../core/orchestrator/events.dart';
import '../../../../../core/usecase/usecase.dart';
import '../../../../../core/utils/option_ext.dart';
import '../../../domain/usecases/add_book.dart';
import '../../../domain/usecases/filter_books.dart';
import '../../../domain/usecases/list_books.dart';
import '../../../domain/usecases/update_book.dart';
import 'books_event.dart';
import 'books_state.dart';

final class BooksBloc extends Bloc<BooksEvent, BooksState> {
  BooksBloc({
    required this.eventBus,
    required this.addBook,
    required this.listBooks,
    required this.updateBook,
    required this.filterBooks,
  }) : super(const BooksState.initial()) {
    on<RefreshBooksList>(_onRefreshBooksList);
    on<SaveBook>(_onBookAdded);
    on<BookSwiped>(_onBookSwiped);
    on<TagToggled>(_onTagToggled);
    on<BooksFiltered>(_onBooksFiltered);
    add(RefreshBooksList());
  }

  final Bus eventBus;

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

  Future<void> _onBookAdded(SaveBook event, Emitter<BooksState> emit) async {
    final result = await addBook(
      AddParams(
        book: event.book,
        bookState: event.bookState,
        selectedTags: event.selectedTags,
      ),
    );
    await result.when(
      (success) async => await _emitSavedBooks(emit),
      (error) async => emit(const BooksState.addingBookFailed()),
    );
  }

  Future<void> _onBookSwiped(BookSwiped event, Emitter<BooksState> emit) async {
    await event.book.move(event.dir).ifSome((updated) async {
      final result = await updateBook(UpdateParams(modified: updated));
      await result.when((success) async {
        await _emitSavedBooks(emit);

        assert(switch ((event.dir, event.book.state)) {
          (Swiped.right, BookState.read) => false,
          (Swiped.left, BookState.readLater) => false,
          _ => true,
        }, 'Invalid swipe for current book state.');

        final stat = switch ((event.dir, updated.state)) {
          (Swiped.right, BookState.read) => $BookFinished(updatedBook: updated),
          (Swiped.right, BookState.reading) => $BookStarted(),
          (Swiped.left, BookState.reading) => $BookUnfinished(book: event.book),
          (Swiped.left, BookState.readLater) => $BookUnstarted(),
          _ => null,
        };

        if (stat != null) eventBus.fire(stat);
      }, (error) async => emit(const BooksState.updatingBookFailed()));
    });
  }

  Future<void> _onTagToggled(TagToggled event, Emitter<BooksState> emit) async {
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
