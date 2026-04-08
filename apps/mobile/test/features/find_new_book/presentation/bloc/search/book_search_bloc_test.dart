import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/find_new_book/domain/usecases/search_and_check_saved.dart';
import 'package:homer/features/find_new_book/presentation/bloc/search/book_search_bloc.dart';
import 'package:homer/features/find_new_book/presentation/bloc/search/book_search_event.dart';
import 'package:homer/features/find_new_book/presentation/bloc/search/book_search_state.dart';
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
    final foundBooks = [fakeBook(), fakeBook(), fakeBook()];
    final failure = TestingFailure();

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit searchFinished with zero found books when query is empty',
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(SearchEvent.searching(query: emptyQuery)),
      expect: () => [
        const BookSearchState(
          foundBooks: [],
          pickedBook: None(),
          mode: BookSearchMode.searchFinished,
          searchFailureCause: None(),
        ),
      ],
      verify: (bloc) => verifyNever(
        bloc.searchForBooks(const SearchParams(query: emptyQuery)),
      ),
    );

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit searching and searchFinished when query is not empty',
      build: () => BlocMock().onSearchForBooks(Success(foundBooks)).get(),
      act: (bloc) => bloc.add(SearchEvent.searching(query: notEmptyQuery)),
      expect: () => [
        const BookSearchState(
          foundBooks: [],
          pickedBook: None(),
          mode: BookSearchMode.searching,
          searchFailureCause: None(),
        ),
        BookSearchState(
          foundBooks: foundBooks,
          pickedBook: const None(),
          mode: BookSearchMode.searchFinished,
          searchFailureCause: const None(),
        ),
      ],
      verify: (bloc) =>
          verify(bloc.searchForBooks(SearchParams(query: notEmptyQuery))),
    );

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit searching and searchFailed when search failed',
      build: () => BlocMock().onSearchForBooks(Error(failure)).get(),
      act: (bloc) => bloc.add(SearchEvent.searching(query: notEmptyQuery)),
      expect: () => [
        const BookSearchState(
          foundBooks: [],
          pickedBook: None(),
          mode: BookSearchMode.searching,
          searchFailureCause: None(),
        ),
        BookSearchState(
          foundBooks: const [],
          pickedBook: const None(),
          mode: BookSearchMode.searchFailed,
          searchFailureCause: some(failure.userMessage()),
        ),
      ],
      verify: (bloc) =>
          verify(bloc.searchForBooks(SearchParams(query: notEmptyQuery))),
    );
  });

  group('_onSuggestionBookPicked', () {
    final book = fakeBook();

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit bookPicked',
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(SearchEvent.suggestionPicked(pickedBook: book)),
      expect: () => [
        BookSearchState(
          foundBooks: const [],
          pickedBook: some(book),
          mode: BookSearchMode.bookPicked,
          searchFailureCause: const None(),
        ),
      ],
    );
  });

  group('_onClearPickedBook', () {
    blocTest<BookSearchBloc, BookSearchState>(
      'should emit bookNotPicked',
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(ClearPickedBook()),
      expect: () => [
        const BookSearchState(
          foundBooks: [],
          pickedBook: None(),
          mode: BookSearchMode.bookNotPicked,
          searchFailureCause: None(),
        ),
      ],
    );
  });
}

final class BlocMock {
  BlocMock() {
    provideDummy<Result<List<Book>, Failure>>(const Success([]));
    provideDummy<Result<Book, Failure>>(Success(fakeBook()));

    _searchForBooks = MockSearchForBooks();

    when(_searchForBooks.call(any)).thenAnswer((_) => withSuccess([]));
  }

  late final MockSearchForBooks _searchForBooks;

  BlocMock onSearchForBooks(Result<List<Book>, Failure> ret) {
    when(_searchForBooks.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BookSearchBloc get() => _createMock();

  BookSearchBloc _createMock() {
    return BookSearchBloc(searchForBooks: _searchForBooks);
  }

  BookSearchBloc allWorking() => _createMock();
}
