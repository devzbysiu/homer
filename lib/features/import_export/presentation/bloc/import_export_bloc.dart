import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/orchestrator/bus.dart';
import '../../../../core/orchestrator/events.dart';
import '../../domain/usecases/export_books.dart';
import '../../domain/usecases/import_books.dart';
import '../../domain/usecases/replace_all_books.dart';
import 'import_export_event.dart';
import 'import_export_state.dart';

final class ImportExportBloc
    extends Bloc<ImportExportEvent, ImportExportState> {
  ImportExportBloc({
    required this.eventBus,
    required this.importBooks,
    required this.exportBooks,
    required this.replaceAllBooks,
  }) : super(const ImportExportState.initial()) {
    on<ImportTriggered>(_onImportTriggered);
    on<ExportTriggered>(_onExportTriggered);
  }

  final Bus eventBus;

  final ImportBooks importBooks;

  final ExportBooks exportBooks;

  final ReplaceAllBooks replaceAllBooks;

  Future<void> _onImportTriggered(
    ImportTriggered event,
    Emitter<ImportExportState> emit,
  ) async {
    emit(const ImportExportState.importInProgress());
    final result = await importBooks(ImportParams(path: event.path));
    await result.when(
      (books) async => await _addToBooksRepo(books, emit),
      (error) async => emit(const ImportExportState.importFailed()),
    );
  }

  Future<void> _addToBooksRepo(
    List<Book> books,
    Emitter<ImportExportState> emit,
  ) async {
    final result = await replaceAllBooks(ReplaceParams(books: books));
    result.when((success) {
      emit(const ImportExportState.importDone());
      eventBus.fire($ImportFinished());
    }, (error) => emit(const ImportExportState.importFailed()));
  }

  Future<void> _onExportTriggered(
    ExportTriggered event,
    Emitter<ImportExportState> emit,
  ) async {
    emit(const ImportExportState.exportInProgress());
    final result = await exportBooks(ExportParams(path: event.path));
    result.when(
      (success) => emit(const ImportExportState.exportFinished()),
      (error) => emit(const ImportExportState.exportFailed()),
    );
  }
}
