import 'package:bloc_test/bloc_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/manage_books/domain/usecases/add_book.dart';
import 'package:homer/features/manage_books/domain/usecases/filter_books.dart';
import 'package:homer/features/manage_books/domain/usecases/update_book.dart';
import 'package:homer/features/manage_books/presentation/bloc/listing/books_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../../test_utils/failure.dart';
import '../../../../../test_utils/fakes.dart';
import '../../../../../test_utils/mock_return_helpers.dart';
import '../../../../../test_utils/mocks.mocks.dart';

void main() {
  group('_onRefreshBooksList', () {
    final books = [fakeBook(), fakeBook(), fakeBook()];

    blocTest<BooksBloc, BooksState>(
      'should be triggered on BLoC creation and emit booksLoaded on success',
      build: () => BlocMock().onListBooks(Success(books)).get(),
      act: (bloc) {/* do nothing */},
      expect: () => [BooksState.booksLoaded(books)],
      verify: (bloc) => verify(bloc.listBooks(NoParams())),
    );

    blocTest<BooksBloc, BooksState>(
      'should be triggered on BLoC creation and emit loadingFailed on failure',
      build: () => BlocMock().onListBooks(Error(TestingFailure())).get(),
      act: (bloc) {/* do nothing */},
      expect: () => [const BooksState.loadingFailed()],
      verify: (bloc) => verify(bloc.listBooks(NoParams())),
    );

    blocTest<BooksBloc, BooksState>(
      'should emit booksLoaded on success',
      build: () => BlocMock().onListBooks(Success(books)).get(),
      act: (bloc) => bloc.add(RefreshBooksList()),
      expect: () => [BooksState.booksLoaded(books)],
      verify: (bloc) => verify(bloc.listBooks(NoParams())),
    );

    blocTest<BooksBloc, BooksState>(
      'should emit failedToLoadBooks on failure',
      build: () => BlocMock().onListBooks(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(RefreshBooksList()),
      expect: () => [const BooksState.loadingFailed()],
      verify: (bloc) => verify(bloc.listBooks(NoParams())),
    );
  });

  group('_onBookAdded', () {
    final books = [fakeBook(), fakeBook(), fakeBook()];
    final newBook = fakeBook();

    blocTest<BooksBloc, BooksState>(
      'should emit booksLoaded on success',
      build: () => BlocMock()
          .onListBooks(Success(books))
          .onAddBooks(const Success(unit))
          .get(),
      act: (bloc) => bloc.add(BookAdded(newBook, newBook.state, const [])),
      expect: () => [BooksState.booksLoaded(books)],
      verify: (bloc) {
        verify(bloc.addBook(AddParams(
          book: newBook,
          bookState: newBook.state,
          selectedTags: const [],
        )));
        verify(bloc.listBooks(NoParams()));
      },
    );

    blocTest<BooksBloc, BooksState>(
      'should emit addingBooksFailed on failure',
      build: () => BlocMock()
          .onListBooks(Success(books))
          .onAddBooks(Error(TestingFailure()))
          .get(),
      act: (bloc) => bloc.add(BookAdded(newBook, newBook.state, const [])),
      expect: () => [
        BooksState.booksLoaded(books),
        const BooksState.addingBookFailed(),
      ],
      verify: (bloc) {
        verify(bloc.addBook(AddParams(
          book: newBook,
          bookState: newBook.state,
          selectedTags: const [],
        )));
        verify(bloc.listBooks(NoParams()));
      },
    );
  });

  group('_onBookSwipedRight', () {
    final books = [fakeBook(), fakeBook(), fakeBook()];
    final book = fakeBook();

    blocTest<BooksBloc, BooksState>(
      'should emit booksLoaded on success',
      build: () => BlocMock()
          .onListBooks(Success(books))
          .onUpdateBook(const Success(unit))
          .get(),
      act: (bloc) => bloc.add(BookSwipedRight(book)),
      expect: () => [BooksState.booksLoaded(books)],
      verify: (bloc) {
        verify(bloc.updateBook(UpdateParams(modified: book.moveRight())));
        verify(bloc.listBooks(NoParams()));
      },
    );

    blocTest<BooksBloc, BooksState>(
      'should emit updatingBookFailed on failure',
      build: () => BlocMock()
          .onListBooks(Success(books))
          .onUpdateBook(Error(TestingFailure()))
          .get(),
      act: (bloc) => bloc.add(BookSwipedRight(book)),
      expect: () => [
        BooksState.booksLoaded(books),
        const BooksState.updatingBookFailed(),
      ],
      verify: (bloc) {
        verify(bloc.updateBook(UpdateParams(modified: book.moveRight())));
        verify(bloc.listBooks(NoParams()));
      },
    );
  });

  group('_onBookSwipedLeft', () {
    final books = [fakeBook(), fakeBook(), fakeBook()];
    final book = fakeBook();

    blocTest<BooksBloc, BooksState>(
      'should emit booksLoaded on success',
      build: () => BlocMock()
          .onListBooks(Success(books))
          .onUpdateBook(const Success(unit))
          .get(),
      act: (bloc) => bloc.add(BookSwipedLeft(book)),
      expect: () => [BooksState.booksLoaded(books)],
      verify: (bloc) {
        verify(bloc.updateBook(UpdateParams(modified: book.moveLeft())));
        verify(bloc.listBooks(NoParams()));
      },
    );

    blocTest<BooksBloc, BooksState>(
      'should emit updatingBookFailed on failure',
      build: () => BlocMock()
          .onListBooks(Success(books))
          .onUpdateBook(Error(TestingFailure()))
          .get(),
      act: (bloc) => bloc.add(BookSwipedLeft(book)),
      expect: () => [
        BooksState.booksLoaded(books),
        const BooksState.updatingBookFailed(),
      ],
      verify: (bloc) {
        verify(bloc.updateBook(UpdateParams(modified: book.moveLeft())));
        verify(bloc.listBooks(NoParams()));
      },
    );
  });

  group('_onTagToggled', () {
    final books = [fakeBook(), fakeBook(), fakeBook()];
    final book = fakeBook();
    final tag = fakeTag();

    blocTest<BooksBloc, BooksState>(
      'should emit booksLoaded with added tag on success',
      build: () => BlocMock()
          .onListBooks(Success(books))
          .onUpdateBook(const Success(unit))
          .get(),
      act: (bloc) => bloc.add(TagToggled(book, tag)),
      expect: () => [BooksState.booksLoaded(books)],
      verify: (bloc) {
        verify(bloc.updateBook(UpdateParams(
          modified: book.copyWith(tags: [...book.tags, tag]),
        )));
        verify(bloc.listBooks(NoParams()));
      },
    );

    blocTest<BooksBloc, BooksState>(
      'should emit booksLoaded with removed tag on success',
      build: () => BlocMock()
          .onListBooks(Success(books))
          .onUpdateBook(const Success(unit))
          .get(),
      act: (bloc) => bloc.add(TagToggled(book, book.tags.first)),
      expect: () => [BooksState.booksLoaded(books)],
      verify: (bloc) {
        final updatedTags = List.of(book.tags);
        updatedTags.remove(book.tags.first);
        verify(bloc.updateBook(UpdateParams(
          modified: book.copyWith(tags: updatedTags),
        )));
        verify(bloc.listBooks(NoParams()));
      },
    );

    blocTest<BooksBloc, BooksState>(
      'should emit updatingBookFailed on failure',
      build: () => BlocMock()
          .onListBooks(Success(books))
          .onUpdateBook(Error(TestingFailure()))
          .get(),
      act: (bloc) => bloc.add(TagToggled(book, tag)),
      expect: () => [
        BooksState.booksLoaded(books),
        const BooksState.updatingBookFailed(),
      ],
      verify: (bloc) {
        verify(bloc.updateBook(UpdateParams(
          modified: book.copyWith(tags: [...book.tags, tag]),
        )));
        verify(bloc.listBooks(NoParams()));
      },
    );
  });

  group('_onBooksFiltered', () {
    final books = [fakeBook(), fakeBook(), fakeBook()];
    final query = fakeSearchQuery();

    blocTest<BooksBloc, BooksState>(
      'should emit booksLoaded on success',
      build: () => BlocMock().onFilterBooks(Success(books)).get(),
      act: (bloc) => bloc.add(BooksFiltered(query)),
      expect: () => [
        const BooksState.booksLoaded([]),
        BooksState.booksLoaded(books),
      ],
      verify: (bloc) => verify(bloc.filterBooks(FilterParams(query: query))),
    );

    blocTest<BooksBloc, BooksState>(
      'should emit loadingFailed on failure',
      build: () => BlocMock().onFilterBooks(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(BooksFiltered(query)),
      expect: () => [const BooksState.loadingFailed()],
      verify: (bloc) => verify(bloc.filterBooks(FilterParams(query: query))),
    );
  });
}

final class BlocMock {
  BlocMock() {
    provideDummy<Result<List<Book>, Failure>>(const Success([]));
    provideDummy<Result<Unit, Failure>>(const Success(unit));

    _addBook = MockAddBook();
    _listBooks = MockListSortedBooks();
    _updateBook = MockUpdateBook();
    _filterBooks = MockFilterBooks();

    when(_listBooks.call(any)).thenAnswer((_) => withSuccess([]));
  }

  late final MockAddBook _addBook;

  late final MockListSortedBooks _listBooks;

  late final MockUpdateBook _updateBook;

  late final MockFilterBooks _filterBooks;

  BlocMock onAddBooks(Result<Unit, Failure> ret) {
    when(_addBook.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BlocMock onListBooks(Result<List<Book>, Failure> ret) {
    when(_listBooks.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BlocMock onUpdateBook(Result<Unit, Failure> ret) {
    when(_updateBook.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BlocMock onFilterBooks(Result<List<Book>, Failure> ret) {
    when(_filterBooks.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BooksBloc get() => _createMock();

  BooksBloc _createMock() {
    return BooksBloc(
      addBook: _addBook,
      listBooks: _listBooks,
      updateBook: _updateBook,
      filterBooks: _filterBooks,
    );
  }

  BooksBloc allWorking() => _createMock();
}
