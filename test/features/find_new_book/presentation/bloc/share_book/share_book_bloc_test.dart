import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/find_new_book/domain/entities/external_book_info.dart';
import 'package:homer/features/find_new_book/domain/usecases/fetch_shared_book.dart';
import 'package:homer/features/find_new_book/domain/usecases/fetch_shared_book_info.dart';
import 'package:homer/features/find_new_book/presentation/bloc/search/book_search_bloc.dart';
import 'package:homer/features/find_new_book/presentation/bloc/share_book/share_book_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../../test_utils/failure.dart';
import '../../../../../test_utils/fakes.dart';
import '../../../../../test_utils/mock_return_helpers.dart';
import '../../../../../test_utils/mocks.mocks.dart';

void main() {
  group('_onBookSharedFromOutside', () {
    final url = fakeUrl();
    final pickedBook = fakeBook();
    final failure = TestingFailure();
    final noIsbnBI = fakeExternalBookInfo().copyWith(isbn: const None());
    final bookInfo = fakeExternalBookInfo();

    blocTest<ShareBookBloc, ShareBookState>(
      'should emit fetchingDetailsFailed when fetching shared book info failed',
      build: () => BlocMock().onFetchSharedBookInfo(Error(failure)).get(),
      act: (bloc) => bloc.add(BookSharedFromOutside(url)),
      expect: () => [
        const ShareBookState(
          sharedBook: None(),
          value: ShareState.fetchingBookDetails,
          cause: None(),
        ),
        const ShareBookState(
          sharedBook: None(),
          value: ShareState.fetchingDetailsFailed,
          cause: None(),
        ),
      ],
      verify: (bloc) => verify(bloc.fetchSharedBookInfo(
        FetchInfoParams(url: url),
      )),
    );

    blocTest<ShareBookBloc, ShareBookState>(
      'should fire ShareOffloaded and go back to initial state when no isbn in book info',
      build: () => BlocMock().onFetchSharedBookInfo(Success(noIsbnBI)).get(),
      act: (bloc) => bloc.add(BookSharedFromOutside(url)),
      expect: () => [
        const ShareBookState(
          sharedBook: None(),
          value: ShareState.fetchingBookDetails,
          cause: None(),
        ),
        const ShareBookState(
          sharedBook: None(),
          value: ShareState.initial,
          cause: None(),
        ),
      ],
      verify: (bloc) {
        verify(bloc.fetchSharedBookInfo(FetchInfoParams(url: url)));
        verify(bloc.eventBus.fire(ShareOffloaded(noIsbnBI.title)));
      },
    );

    blocTest<ShareBookBloc, ShareBookState>(
      'should emit fetchingSharedBookDetails and fetchingDetailsFailed on failure of fetching book details',
      build: () => BlocMock()
          .onFetchSharedBookInfo(Success(bookInfo))
          .onFetchSharedBook(Error(failure))
          .get(),
      act: (bloc) => bloc.add(BookSharedFromOutside(url)),
      expect: () => [
        const ShareBookState(
          sharedBook: None(),
          value: ShareState.fetchingBookDetails,
          cause: None(),
        ),
        ShareBookState(
          sharedBook: const None(),
          value: ShareState.fetchingDetailsFailed,
          cause: some(failure.userMessage()),
        ),
      ],
      verify: (bloc) {
        verify(bloc.fetchSharedBookInfo(FetchInfoParams(url: url)));
        verify(bloc.fetchSharedBook(
          FetchBookParams(isbn: bookInfo.isbn.toNullable()!),
        ));
      },
    );

    blocTest<ShareBookBloc, ShareBookState>(
      'should emit fetchingSharedBookDetails and bookShared on success',
      build: () => BlocMock()
          .onFetchSharedBookInfo(Success(bookInfo))
          .onFetchSharedBook(Success(pickedBook))
          .get(),
      act: (bloc) => bloc.add(BookSharedFromOutside(url)),
      expect: () => [
        const ShareBookState(
          sharedBook: None(),
          value: ShareState.fetchingBookDetails,
          cause: None(),
        ),
        ShareBookState(
          sharedBook: some(pickedBook),
          value: ShareState.bookShared,
          cause: const None(),
        ),
      ],
      verify: (bloc) {
        verify(bloc.fetchSharedBookInfo(FetchInfoParams(url: url)));
        verify(bloc.fetchSharedBook(
          FetchBookParams(isbn: bookInfo.isbn.toNullable()!),
        ));
      },
    );
  });
}

final class BlocMock {
  BlocMock() {
    provideDummy<Result<List<Book>, Failure>>(const Success([]));
    provideDummy<Result<Book, Failure>>(Success(fakeBook()));
    provideDummy<Result<ExternalBookInfo, Failure>>(Success(
      fakeExternalBookInfo(),
    ));

    _eventBus = MockBus();
    _shareHandler = MockShareHandlerPlatform();
    _fetchSharedBook = MockFetchSharedBook();
    _fetchSharedBookInfo = MockFetchSharedBookInfo();

    when(_shareHandler.getInitialSharedMedia()).thenAnswer((_) => withIt(null));
    when(_shareHandler.sharedMediaStream).thenAnswer(
      (_) => const Stream.empty(),
    );
    when(_fetchSharedBook.call(any)).thenAnswer((_) => withSuccess(fakeBook()));
  }

  late final MockBus _eventBus;

  late final MockShareHandlerPlatform _shareHandler;

  late final MockFetchSharedBook _fetchSharedBook;

  late final MockFetchSharedBookInfo _fetchSharedBookInfo;

  BlocMock onFetchSharedBook(Result<Book, Failure> ret) {
    when(_fetchSharedBook.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BlocMock onFetchSharedBookInfo(Result<ExternalBookInfo, Failure> ret) {
    when(_fetchSharedBookInfo.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  ShareBookBloc get() {
    return ShareBookBloc(
      eventBus: _eventBus,
      fetchSharedBook: _fetchSharedBook,
      fetchSharedBookInfo: _fetchSharedBookInfo,
      shareHandler: _shareHandler,
    );
  }
}
