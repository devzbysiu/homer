import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/entities/restored_book.dart';
import '../../domain/usecases/add_all_books.dart';
import '../../domain/usecases/restore_from_local.dart';

part 'backup_and_restore_event.dart';
part 'backup_and_restore_state.dart';

class BackupAndRestoreBloc
    extends Bloc<BackupAndRestoreEvent, BackupAndRestoreState> {
  BackupAndRestoreBloc({
    required this.loadFromLocalBackup,
    required this.addAllBooks,
  }) : super(BackupAndRestoreInitial()) {
    on<RestoreTriggered>(_onRestoreTriggered);
  }

  final LoadFromLocalBackup loadFromLocalBackup;

  final AddAllBooks addAllBooks;

  Future<void> _onRestoreTriggered(
    RestoreTriggered event,
    Emitter<BackupAndRestoreState> emit,
  ) async {
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
    final addAllResult = await addAllBooks(AddAllParams(books: restoredBooks));
    addAllResult.when(
      (success) => emit(BooksRestored()),
      (error) => emit(FailedToRestoreBooks()),
    );
    return Future.value();
  }
}
