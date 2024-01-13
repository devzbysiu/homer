import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/find_new_book/domain/usecases/search_and_check_saved.dart';
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
    final foundBooks = [fakeBook(), fakeBook(), fakeBook()];

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit searchingFinished when query is empty',
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(SearchInitiated(emptyQuery)),
      expect: () => [const BookSearchState.initial().searchFinished([])],
      verify: (bloc) => verifyNever(bloc.searchForBooks(
        const SearchParams(query: emptyQuery),
      )),
    );

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit searching and searchFinished when query is not empty',
      build: () => BlocMock().onSearchForBooks(Success(foundBooks)).get(),
      act: (bloc) => bloc.add(SearchInitiated(notEmptyQuery)),
      expect: () => [
        const BookSearchState.initial().searching(),
        const BookSearchState.initial().searchFinished(foundBooks),
      ],
      verify: (bloc) => verify(bloc.searchForBooks(
        SearchParams(query: notEmptyQuery),
      )),
    );

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit searching and failedToSearchBooks when search failed',
      build: () => BlocMock().onSearchForBooks(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(SearchInitiated(notEmptyQuery)),
      expect: () => [
        const BookSearchState.initial().searching(),
        const BookSearchState.initial().searchFailed(),
      ],
      verify: (bloc) => verify(bloc.searchForBooks(
        SearchParams(query: notEmptyQuery),
      )),
    );
  });

  group('_onSuggestionBookPicked', () {
    final book = fakeBook();

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit suggestionPicked',
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(SuggestedBookPicked(book)),
      expect: () => [BookSearchState.picked(some(book))],
    );
  });

  group('_onClearPickedBook', () {
    blocTest<BookSearchBloc, BookSearchState>(
      'should emit suggestionNotPicked',
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(ClearPickedBook()),
      expect: () => [const BookSearchState.noPickedBook()],
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
