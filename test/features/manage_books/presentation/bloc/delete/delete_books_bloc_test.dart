import 'package:bloc_test/bloc_test.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/core/orchestrator/events.dart';
import 'package:homer/features/manage_books/domain/usecases/delete_books.dart';
import 'package:homer/features/manage_books/presentation/bloc/delete/delete_books_bloc.dart';
import 'package:homer/features/manage_books/presentation/bloc/delete/delete_books_event.dart';
import 'package:homer/features/manage_books/presentation/bloc/delete/delete_books_state.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:test/test.dart';

import '../../../../../test_utils/failure.dart';
import '../../../../../test_utils/fakes.dart';
import '../../../../../test_utils/mock_return_helpers.dart';
import '../../../../../test_utils/mocks.mocks.dart';

void main() {
  group('_onToggleBookOnDeleteList', () {
    final book = fakeBook();

    blocTest<DeleteBooksBloc, DeleteBooksState>(
      'should emit deletionList with book if it was not on the list before',
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(DeleteModeToggled(book)),
      expect:
          () => [
            DeleteBooksState.deletionList([book]),
          ],
    );

    blocTest<DeleteBooksBloc, DeleteBooksState>(
      'should emit deletionList without book if it was on the list before',
      build: () => BlocMock().allWorking(),
      act:
          (bloc) =>
              bloc
                ..add(DeleteModeToggled(book))
                ..add(DeleteModeToggled(book)),
      expect:
          () => [
            DeleteBooksState.deletionList([book]),
            DeleteBooksState.deletionList([]),
          ],
    );
  });

  group('_onDeleteBooks', () {
    final book = fakeBook();

    blocTest<DeleteBooksBloc, DeleteBooksState>(
      'should not emit when list of books to delete is empty',
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(DeletePickedBooks()),
      expect: () => [],
      verify: (bloc) {
        verifyNever(bloc.deleteBooks(const DeleteParams(books: [])));
        verifyNever(bloc.eventBus.fire(DeleteBooksFinished()));
      },
    );

    blocTest<DeleteBooksBloc, DeleteBooksState>(
      'should emit booksRemoved on success',
      build: () => BlocMock().allWorking(),
      act:
          (bloc) =>
              bloc
                ..add(DeleteModeToggled(book))
                ..add(DeletePickedBooks()),
      expect:
          () => [
            DeleteBooksState.deletionList([book]),
            DeleteBooksState.booksRemoved(),
          ],
      verify: (bloc) {
        verify(bloc.deleteBooks(DeleteParams(books: [book])));
        verify(bloc.eventBus.fire(DeleteBooksFinished()));
      },
    );

    blocTest<DeleteBooksBloc, DeleteBooksState>(
      'should emit deletionFailed on failure',
      build: () => BlocMock().onDeleteBooks(Error(TestingFailure())).get(),
      act:
          (bloc) =>
              bloc
                ..add(DeleteModeToggled(book))
                ..add(DeletePickedBooks()),
      expect:
          () => [
            DeleteBooksState.deletionList([book]),
            DeleteBooksState.deletionFailed(),
          ],
      verify: (bloc) {
        verify(bloc.deleteBooks(DeleteParams(books: [book])));
        verifyNever(bloc.eventBus.fire(DeleteBooksFinished()));
      },
    );
  });

  group('_onCleanDeletionList', () {
    blocTest<DeleteBooksBloc, DeleteBooksState>(
      'should emit deletionListCleared',
      build: () => BlocMock().allWorking(),
      act: (bloc) => bloc.add(ClearDeletionList()),
      expect: () => [const DeleteBooksState.deletionListCleared()],
      verify: (bloc) {
        verifyNever(bloc.deleteBooks(const DeleteParams(books: [])));
        verifyNever(bloc.eventBus.fire(DeleteBooksFinished()));
      },
    );
  });
}

final class BlocMock {
  BlocMock() {
    provideDummy<Result<Unit, Failure>>(const Success(unit));

    _deleteBooks = MockDeleteBooks();
    _eventBus = MockBus();

    when(_deleteBooks.call(any)).thenAnswer((_) => withSuccess(unit));
  }

  late final MockBus _eventBus;

  late final MockDeleteBooks _deleteBooks;

  BlocMock onDeleteBooks(Result<Unit, Failure> ret) {
    when(_deleteBooks.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  DeleteBooksBloc get() => _createMock();

  DeleteBooksBloc _createMock() {
    return DeleteBooksBloc(deleteBooks: _deleteBooks, eventBus: _eventBus);
  }

  DeleteBooksBloc allWorking() => _createMock();
}
