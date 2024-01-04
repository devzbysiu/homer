import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/find_new_book/presentation/bloc/search/book_search_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../test_utils/failure.dart';
import '../../../../../test_utils/fakes.dart';
import '../../../../../test_utils/mock_return_helpers.dart';
import '../../../../../test_utils/mocks.mocks.dart';

void main() {
  group('_onSearchInitiated', () {
    const emptyQuery = '';
    final notEmptyQuery = fakeSearchQuery();

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit notSearching when query is empty',
      build: () => BookSearchBlocMock().allWorking(),
      act: (bloc) => bloc.add(SearchInitiated(emptyQuery)),
      expect: () => [const BookSearchState()],
    );

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit searchInProgress and searchFinished when query is not empty',
      build: () => BookSearchBlocMock().allWorking(),
      act: (bloc) => bloc.add(SearchInitiated(notEmptyQuery)),
      expect: () => [
        const BookSearchState().copyWith(isSearchInProgress: true),
        const BookSearchState().copyWith(isSearchInProgress: false),
      ],
    );

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit searchInProgress and failedToSearchBooks when search failed',
      build: () =>
          BookSearchBlocMock().onSearchForBooks(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(SearchInitiated(notEmptyQuery)),
      expect: () => [
        const BookSearchState().copyWith(isSearchInProgress: true),
        FailedToSearchBooks(),
      ],
    );
  });

  group('_onSuggestedBookPicked', () {
    final pickedBook = fakeBook();

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit bookPicked',
      build: () => BookSearchBlocMock().allWorking(),
      act: (bloc) => bloc.add(SuggestedBookPicked(pickedBook)),
      expect: () => [BookPicked(pickedBook: some(pickedBook))],
    );
  });

  group('_onClearPickedBook', () {
    blocTest<BookSearchBloc, BookSearchState>(
      'should emit noPickedBook',
      build: () => BookSearchBlocMock().allWorking(),
      act: (bloc) => bloc.add(ClearPickedBook()),
      expect: () => [NoPickedBook()],
    );
  });

  group('_onBookSharedFromOutside', () {
    final url = fakeUrl();
    final pickedBook = fakeBook();
    final failure = TestingFailure();

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit fetchingSharedBookDetails and bookShared on success',
      build: () =>
          BookSearchBlocMock().onFetchSharedBook(Success(pickedBook)).get(),
      act: (bloc) => bloc.add(BookSharedFromOutside(url)),
      expect: () => [
        FetchingSharedBookDetails(),
        BookShared(pickedBook: some(pickedBook)),
      ],
    );

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit fetchingSharedBookDetails and failedToLookUpSharedBook on failure',
      build: () => BookSearchBlocMock().onFetchSharedBook(Error(failure)).get(),
      act: (bloc) => bloc.add(BookSharedFromOutside(url)),
      expect: () => [
        FetchingSharedBookDetails(),
        FailedToLookUpSharedBook(cause: failure.userMessage()),
      ],
    );
  });
}

final class BookSearchBlocMock {
  BookSearchBlocMock() {
    provideDummy<Result<List<Book>, Failure>>(const Success([]));
    provideDummy<Result<Book, Failure>>(Success(fakeBook()));

    _shareHandler = MockShareHandlerPlatform();
    _searchForBooks = MockSearchForBooks();
    _fetchSharedBook = MockFetchSharedBook();

    when(_shareHandler.getInitialSharedMedia()).thenAnswer((_) => withIt(null));
    when(_shareHandler.sharedMediaStream).thenAnswer(
      (_) => const Stream.empty(),
    );
    when(_searchForBooks.call(any)).thenAnswer((_) => withSuccess([]));
    when(_fetchSharedBook.call(any)).thenAnswer((_) => withSuccess(fakeBook()));
  }

  late final MockShareHandlerPlatform _shareHandler;

  late final MockSearchForBooks _searchForBooks;

  late final MockFetchSharedBook _fetchSharedBook;

  BookSearchBlocMock onSearchForBooks(Result<List<Book>, Failure> ret) {
    when(_searchForBooks.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BookSearchBlocMock onFetchSharedBook(Result<Book, Failure> ret) {
    when(_fetchSharedBook.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BookSearchBloc get() {
    return _createMock();
  }

  BookSearchBloc _createMock() {
    return BookSearchBloc(
      shareHandler: _shareHandler,
      searchForBooks: _searchForBooks,
      fetchSharedBook: _fetchSharedBook,
    );
  }

  BookSearchBloc allWorking() {
    return _createMock();
  }
}
