import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/find_new_book/domain/usecases/fetch_shared_book.dart';
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

    blocTest<ShareBookBloc, ShareBookState>(
      'should emit fetchingSharedBookDetails and bookShared on success',
      build: () => MockBuilder().onFetchSharedBook(Success(pickedBook)).get(),
      act: (bloc) => bloc.add(BookSharedFromOutside(url)),
      expect: () => [
        const ShareBookState.fetchingSharedBookDetails(),
        ShareBookState.bookShared(pickedBook),
      ],
      verify: (bloc) => verify(bloc.fetchSharedBook(FetchParams(url: url))),
    );

    blocTest<ShareBookBloc, ShareBookState>(
      'should emit fetchingSharedBookDetails and failedToLookUpSharedBook on failure',
      build: () => MockBuilder().onFetchSharedBook(Error(failure)).get(),
      act: (bloc) => bloc.add(BookSharedFromOutside(url)),
      expect: () => [
        const ShareBookState.fetchingSharedBookDetails(),
        ShareBookState.fetchingDetailsFailed(failure.userMessage()),
      ],
      verify: (bloc) => verify(bloc.fetchSharedBook(FetchParams(url: url))),
    );
  });
}

final class MockBuilder {
  MockBuilder() {
    provideDummy<Result<List<Book>, Failure>>(const Success([]));
    provideDummy<Result<Book, Failure>>(Success(fakeBook()));

    _shareHandler = MockShareHandlerPlatform();
    _fetchSharedBook = MockFetchSharedBook();

    when(_shareHandler.getInitialSharedMedia()).thenAnswer((_) => withIt(null));
    when(_shareHandler.sharedMediaStream).thenAnswer(
      (_) => const Stream.empty(),
    );
    when(_fetchSharedBook.call(any)).thenAnswer((_) => withSuccess(fakeBook()));
  }

  late final MockShareHandlerPlatform _shareHandler;

  late final MockFetchSharedBook _fetchSharedBook;

  MockBuilder onFetchSharedBook(Result<Book, Failure> ret) {
    when(_fetchSharedBook.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  ShareBookBloc get() => _createMock();

  ShareBookBloc _createMock() {
    return ShareBookBloc(
      fetchSharedBook: _fetchSharedBook,
      shareHandler: _shareHandler,
    );
  }

  ShareBookBloc allWorking() => _createMock();
}
