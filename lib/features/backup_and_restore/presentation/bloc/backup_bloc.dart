import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/orchestrator/bus.dart';
import '../../../../core/orchestrator/events.dart';
import '../../domain/usecases/load_backup.dart';
import '../../domain/usecases/make_backup.dart';
import '../../domain/usecases/replace_all_books.dart';

part 'backup_event.dart';
part 'backup_state.dart';

final class BackupBloc extends Bloc<BackupEvent, BackupState> {
  BackupBloc({
    required this.eventBus,
    required this.loadBackup,
    required this.makeBackup,
    required this.replaceAllBooks,
  }) : super(const BackupState.initial()) {
    on<RestoreTriggered>(_onRestoreTriggered);
    on<BackupTriggered>(_onBackupTriggered);
  }

  final Bus eventBus;

  final LoadBackup loadBackup;

  final MakeBackup makeBackup;

  final ReplaceAllBooks replaceAllBooks;

  Future<void> _onRestoreTriggered(
    RestoreTriggered event,
    Emitter<BackupState> emit,
  ) async {
    emit(const BackupState.restoreInProgress());
    final result = await loadBackup(RestoreParams(path: event.path));
    await result.when(
      (books) async => await _addToBooksRepo(books, emit),
      (error) async => emit(const BackupState.restoreFailed()),
    );
  }

  Future<void> _addToBooksRepo(
    List<Book> books,
    Emitter<BackupState> emit,
  ) async {
    final result = await replaceAllBooks(ReplaceParams(books: books));
    result.when((success) {
      emit(const BackupState.restoreFinished());
      eventBus.fire(RestoreFinished());
    }, (error) => emit(const BackupState.restoreFailed()));
  }

  Future<void> _onBackupTriggered(
    BackupTriggered event,
    Emitter<BackupState> emit,
  ) async {
    emit(const BackupState.backupInProgress());
    final result = await makeBackup(BackupParams(path: event.path));
    result.when(
      (success) => emit(const BackupState.backupFinished()),
      (error) => emit(const BackupState.backupFailed()),
    );
  }
}
