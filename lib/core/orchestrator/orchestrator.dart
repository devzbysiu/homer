import '../../features/backup_and_restore/presentation/bloc/backup_bloc.dart';
import '../../features/manage_books/presentation/bloc/listing/books_bloc.dart';
import '../../features/stats/presentation/bloc/stats_bloc.dart';
import 'bus.dart';
import 'events.dart';

final class Orchestrator {
  Orchestrator({
    required this.eventBus,
    required this.backupBloc,
    required this.statsBloc,
    required this.booksBloc,
  }) {
    // Backup and Restore
    eventBus.on<RestoreStarted>(_onRestoreStarted);
    eventBus.on<RestoreFinished>(_onRestoreFinished);
    eventBus.on<BackupStarted>(_onBackupStarted);
  }

  final Bus eventBus;

  final BackupBloc backupBloc;

  final StatsBloc statsBloc;

  final BooksBloc booksBloc;

  void _onRestoreStarted(RestoreStarted event) {
    backupBloc.add(RestoreTriggered(event.backupPath));
  }

  void _onRestoreFinished(_) {
    statsBloc.add(LoadStats());
    booksBloc.add(RefreshBooksList());
  }

  void _onBackupStarted(BackupStarted event) {
    backupBloc.add(BackupTriggered(event.backupPath));
  }
}
