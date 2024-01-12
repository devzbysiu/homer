import 'package:bloc_test/bloc_test.dart';
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

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit searchingFinished when query is empty',
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(SearchInitiated(emptyQuery)),
      expect: () => [const BookSearchState.searchFinished()],
      verify: (bloc) => verifyNever(bloc.searchForBooks(
        const SearchParams(query: emptyQuery),
      )),
    );

    blocTest<BookSearchBloc, BookSearchState>(
      'should emit searching and searchFinished when query is not empty',
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(SearchInitiated(notEmptyQuery)),
      expect: () => [
        const BookSearchState.searching(),
        const BookSearchState.searchFinished(),
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
        const BookSearchState.searching(),
        const BookSearchState.searchFailed(),
      ],
      verify: (bloc) => verify(bloc.searchForBooks(
        SearchParams(query: notEmptyQuery),
      )),
    );
  });
}

final class BlocMock {
  BlocMock() {
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

  BlocMock onSearchForBooks(Result<List<Book>, Failure> ret) {
    when(_searchForBooks.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BlocMock onFetchSharedBook(Result<Book, Failure> ret) {
    when(_fetchSharedBook.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BookSearchBloc get() => _createMock();

  BookSearchBloc _createMock() {
    return BookSearchBloc(searchForBooks: _searchForBooks);
  }

  BookSearchBloc allWorking() => _createMock();
}
