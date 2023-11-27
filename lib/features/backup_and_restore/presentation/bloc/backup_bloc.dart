import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/usecase/usecase.dart';
import '../../domain/usecases/add_all_books.dart';
import '../../domain/usecases/load_backup.dart';
import '../../domain/usecases/make_backup.dart';
import '../../domain/usecases/purge_repo.dart';

part 'backup_event.dart';
part 'backup_state.dart';

final class BackupBloc extends Bloc<BackupEvent, BackupState> {
  BackupBloc({
    required this.loadBackup,
    required this.makeBackup,
    required this.addAllBooks,
    required this.purgeRepo,
  }) : super(BackupAndRestoreInitial()) {
    on<RestoreTriggered>(_onRestoreTriggered);
    on<BackupTriggered>(_onBackupTriggered);
  }

  final LoadBackup loadBackup;

  final MakeBackup makeBackup;

  final AddAllBooks addAllBooks;

  final PurgeRepo purgeRepo;

  Future<void> _onRestoreTriggered(
    RestoreTriggered event,
    Emitter<BackupState> emit,
  ) async {
    emit(const RestoreInProgress());
    final restoreResult = await loadBackup(RestoreParams(path: event.path));
    final List<Book> restoredBooks = restoreResult.when(
      (books) => books,
      (error) {
        emit(FailedToRestoreBooks());
        return List.empty();
      },
    );
    await _addToBooksRepo(restoredBooks, emit);
    return Future.value();
  }

  Future<void> _addToBooksRepo(
    List<Book> restoredBooks,
    Emitter<BackupState> emit,
  ) async {
    // just to show progress indicator
    await Future.delayed(const Duration(seconds: 3));
    await purgeRepo(NoParams());
    final addAllResult = await addAllBooks(AddAllParams(books: restoredBooks));
    addAllResult.when(
      (success) => emit(RestoreFinished()),
      (error) => emit(FailedToRestoreBooks()),
    );
    return Future.value();
  }

  Future<void> _onBackupTriggered(
    BackupTriggered event,
    Emitter<BackupState> emit,
  ) async {
    emit(const BackupInProgress());
    // just to show progress indicator
    await Future.delayed(const Duration(seconds: 3));
    await makeBackup(BackupParams(path: event.path));
    emit(BackupFinished());
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
