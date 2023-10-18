import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/restored_book.dart';
import '../../domain/usecases/add_all_books.dart';
import '../../domain/usecases/purge_repo.dart';
import '../../domain/usecases/restore_from_local.dart';
import '../../domain/usecases/save_to_local.dart';

part 'backup_event.dart';
part 'backup_state.dart';

final class BackupBloc extends Bloc<BackupEvent, BackupState> {
  BackupBloc({
    required this.loadFromLocalBackup,
    required this.saveToLocalBackup,
    required this.addAllBooks,
    required this.purgeRepo,
  }) : super(BackupAndRestoreInitial()) {
    on<RestoreTriggered>(_onRestoreTriggered);
    on<BackupTriggered>(_onBackupTriggered);
  }

  final LoadFromLocalBackup loadFromLocalBackup;

  final SaveToLocalBackup saveToLocalBackup;

  final AddAllBooks addAllBooks;

  final PurgeRepo purgeRepo;

  Future<void> _onRestoreTriggered(
    RestoreTriggered event,
    Emitter<BackupState> emit,
  ) async {
    emit(const RestoreInProgress());
    final restoreResult = await loadFromLocalBackup(
      RestoreParams(path: event.path),
    );
    final List<RestoredBook> restoredBooks = restoreResult.when(
      (success) => success,
      (error) {
        emit(FailedToRestoreBooks());
        return List.empty();
      },
    );
    await _addToBooksRepo(restoredBooks, emit);
    return Future.value();
  }

  Future<void> _addToBooksRepo(
    List<RestoredBook> restoredBooks,
    Emitter<BackupState> emit,
  ) async {
    // just to show progress indicator
    await Future.delayed(const Duration(seconds: 3));
    await purgeRepo(NoParams());
    final addAllResult = await addAllBooks(AddAllParams(books: restoredBooks));
    addAllResult.when(
      (success) => emit(const RestoreFinished()),
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
    await saveToLocalBackup(BackupParams(path: event.path));
    emit(const BackupFinished());
    return Future.value();
  }
}
