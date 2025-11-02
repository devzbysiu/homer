import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/core/orchestrator/bus.dart';
import 'package:homer/core/orchestrator/events.dart';
import 'package:homer/features/import_export/domain/usecases/export_books.dart';
import 'package:homer/features/import_export/domain/usecases/import_books.dart';
import 'package:homer/features/import_export/domain/usecases/replace_all_books.dart';
import 'package:homer/features/import_export/presentation/bloc/import_export_bloc.dart';
import 'package:homer/features/import_export/presentation/bloc/import_export_event.dart';
import 'package:homer/features/import_export/presentation/bloc/import_export_state.dart';
import 'package:mockito/mockito.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../test_utils/failure.dart';
import '../../../../test_utils/fakes.dart';
import '../../../../test_utils/mock_return_helpers.dart';
import '../../../../test_utils/mocks.mocks.dart';

void main() {
  group('_onImportTriggered', () {
    final path = fakePath();
    final books = [fakeBook(), fakeBook(), fakeBook()];

    blocTest<ImportExportBloc, ImportExportState>(
      'should emit importInProgress and importDone on success',
      build: () => BlocMock().onImportBooks(Success(books)).get(),
      act: (bloc) => bloc.add(ImportExportEvent.importTriggered(path: path)),
      expect: () => [
        const ImportExportState.importInProgress(),
        const ImportExportState.importDone(),
      ],
      verify: (bloc) {
        verify(bloc.importBooks(ImportParams(path: path)));
        verify(bloc.replaceAllBooks(ReplaceParams(books: books)));
        verify(bloc.eventBus.fire($ImportFinished()));
      },
    );

    blocTest<ImportExportBloc, ImportExportState>(
      'should emit importInProgress and importFailed on ImportBooks failure',
      build: () => BlocMock().onImportBooks(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(ImportExportEvent.importTriggered(path: path)),
      expect: () => [
        const ImportExportState.importInProgress(),
        const ImportExportState.importFailed(),
      ],
      verify: (bloc) => verify(bloc.importBooks(ImportParams(path: path))),
    );

    blocTest<ImportExportBloc, ImportExportState>(
      'should emit importInProgress and importFailed on ReplaceAllBooks failure',
      build: () => BlocMock().onReplaceAllBooks(Error(TestingFailure())).get(),
      act: (bloc) => bloc.add(ImportExportEvent.importTriggered(path: path)),
      expect: () => [
        const ImportExportState.importInProgress(),
        const ImportExportState.importFailed(),
      ],
      verify: (bloc) => verify(bloc.importBooks(ImportParams(path: path))),
    );
  });

  group('_onExportTriggered', () {
    final exportPath = fakePath();

    blocTest<ImportExportBloc, ImportExportState>(
      'should emit exportInProgress and exportFinished on success',
      build: () => BlocMock().allWorking(),
      act: (bloc) =>
          bloc.add(ImportExportEvent.exportTriggered(path: exportPath)),
      expect: () => [
        const ImportExportState.exportInProgress(),
        const ImportExportState.exportFinished(),
      ],
      verify: (bloc) =>
          verify(bloc.exportBooks(ExportParams(path: exportPath))),
    );

    blocTest<ImportExportBloc, ImportExportState>(
      'should emit exportInProgress and exportFailed on failure',
      build: () => BlocMock().onExportBooks(Error(TestingFailure())).get(),
      act: (bloc) =>
          bloc.add(ImportExportEvent.exportTriggered(path: exportPath)),
      expect: () => [
        const ImportExportState.exportInProgress(),
        const ImportExportState.exportFailed(),
      ],
      verify: (bloc) =>
          verify(bloc.exportBooks(ExportParams(path: exportPath))),
    );
  });
}

final class BlocMock {
  BlocMock() {
    provideDummy<Result<List<Book>, Failure>>(const Success([]));
    provideDummy<Result<Unit, Failure>>(const Success(unit));

    _eventBus = MockBus();
    _importBooks = MockImportBooks();
    _exportBooks = MockExportBooks();
    _replaceAllBooks = MockReplaceAllBooks();

    when(_importBooks.call(any)).thenAnswer((_) => withSuccess([]));
    when(_replaceAllBooks.call(any)).thenAnswer((_) => withSuccess(unit));
    when(_exportBooks.call(any)).thenAnswer((_) => withSuccess(unit));
  }

  late final Bus _eventBus;

  late final MockImportBooks _importBooks;

  late final MockExportBooks _exportBooks;

  late final MockReplaceAllBooks _replaceAllBooks;

  BlocMock onImportBooks(Result<List<Book>, Failure> ret) {
    when(_importBooks.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BlocMock onReplaceAllBooks(Result<Unit, Failure> ret) {
    when(_replaceAllBooks.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  BlocMock onExportBooks(Result<Unit, Failure> ret) {
    when(_exportBooks.call(any)).thenAnswer((_) => Future.value(ret));
    return this;
  }

  ImportExportBloc get() => _createMock();

  ImportExportBloc _createMock() {
    return ImportExportBloc(
      eventBus: _eventBus,
      importBooks: _importBooks,
      exportBooks: _exportBooks,
      replaceAllBooks: _replaceAllBooks,
    );
  }

  ImportExportBloc allWorking() => _createMock();
}
