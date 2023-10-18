import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/usecase/usecase.dart';
import '../../domain/entities/restored_book.dart';
import '../../domain/usecases/add_all_books.dart';
import '../../domain/usecases/purge_repo.dart';
import '../../domain/usecases/restore_from_local.dart';

part 'backup_and_restore_event.dart';
part 'backup_and_restore_state.dart';

final class BackupAndRestoreBloc
    extends Bloc<BackupAndRestoreEvent, BackupAndRestoreState> {
  BackupAndRestoreBloc({
    required this.loadFromLocalBackup,
    required this.addAllBooks,
    required this.purgeRepo,
  }) : super(BackupAndRestoreInitial()) {
    on<RestoreTriggered>(_onRestoreTriggered);
  }

  final LoadFromLocalBackup loadFromLocalBackup;

  final AddAllBooks addAllBooks;

  final PurgeRepo purgeRepo;

  Future<void> _onRestoreTriggered(
    RestoreTriggered event,
    Emitter<BackupAndRestoreState> emit,
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
    Emitter<BackupAndRestoreState> emit,
  ) async {
    // just to show progress indicator
    await Future.delayed(const Duration(seconds: 3));
    purgeRepo(NoParams());
    final addAllResult = await addAllBooks(AddAllParams(books: restoredBooks));
    addAllResult.when(
      (success) => emit(const BooksRestored()),
      (error) => emit(FailedToRestoreBooks()),
    );
    return Future.value();
  }
}
