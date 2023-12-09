import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book.dart';
import '../../domain/usecases/load_backup.dart';
import '../../domain/usecases/make_backup.dart';
import '../../domain/usecases/replace_all_books.dart';

part 'backup_event.dart';
part 'backup_state.dart';

final class BackupBloc extends Bloc<BackupEvent, BackupState> {
  BackupBloc({
    required this.loadBackup,
    required this.makeBackup,
    required this.replaceAllBooks,
  }) : super(BackupState.initial()) {
    on<RestoreTriggered>(_onRestoreTriggered);
    on<BackupTriggered>(_onBackupTriggered);
  }

  final LoadBackup loadBackup;

  final MakeBackup makeBackup;

  final ReplaceAllBooks replaceAllBooks;

  Future<void> _onRestoreTriggered(
    RestoreTriggered event,
    Emitter<BackupState> emit,
  ) async {
    emit(BackupState.restoreInProgress());
    final restoreResult = await loadBackup(RestoreParams(path: event.path));
    if (restoreResult.isError()) {
      emit(BackupState.restoreFailed());
      return Future.value();
    }
    final List<Book> restoredBooks = restoreResult.tryGetSuccess()!;
    await _addToBooksRepo(restoredBooks, emit);
    return Future.value();
  }

  Future<void> _addToBooksRepo(
    List<Book> restoredBooks,
    Emitter<BackupState> emit,
  ) async {
    final replaceAllResult = await replaceAllBooks(
      ReplaceAllParams(books: restoredBooks),
    );
    replaceAllResult.when(
      (success) => emit(BackupState.restoreFinished()),
      (error) => emit(BackupState.restoreFailed()),
    );
    return Future.value();
  }

  Future<void> _onBackupTriggered(
    BackupTriggered event,
    Emitter<BackupState> emit,
  ) async {
    emit(BackupState.backupInProgress());
    final makeBackupResult = await makeBackup(BackupParams(path: event.path));
    if (makeBackupResult.isError()) {
      emit(BackupState.backupFailed());
      return Future.value();
    }
    emit(BackupState.backupFinished());
    return Future.value();
  }
}

extension BackupContextExt on BuildContext {
  void restoreBackup(String backupPath) {
    _emitRestoreEvt(RestoreTriggered(backupPath));
  }

  void createBackup(String backupPath) {
    _emitRestoreEvt(BackupTriggered(backupPath));
  }

  void _emitRestoreEvt(BackupEvent event) {
    read<BackupBloc>().add(event);
  }
}
