import '../../features/backup_and_restore/presentation/bloc/backup_bloc.dart';
import '../../features/find_new_book/presentation/bloc/search/book_search_bloc.dart';
import '../../features/find_new_book/presentation/bloc/share_book/share_book_bloc.dart';
import '../../features/find_new_book/presentation/bloc/toggle_tags/on_book_tags_bloc.dart';
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
    required this.bookSearchBloc,
    required this.shareBookBloc,
    required this.onBookTagsBloc,
  }) {
    // Backup and Restore
    eventBus.on<RestoreStarted>(_onRestoreStarted);
    eventBus.on<RestoreFinished>(_onRestoreFinished);
    eventBus.on<BackupStarted>(_onBackupStarted);

    // Find new Book
    eventBus.on<SearchStarted>(_onSearchStarted);
    eventBus.on<SuggestionPicked>(_onSuggestionsPicked);
    eventBus.on<SaveBookStarted>(_onSaveBookStarted);
  }

  final Bus eventBus;

  final BackupBloc backupBloc;

  final StatsBloc statsBloc;

  final BooksBloc booksBloc;

  final BookSearchBloc bookSearchBloc;

  final ShareBookBloc shareBookBloc;

  final OnBookTagsBloc onBookTagsBloc;

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

  void _onSearchStarted(SearchStarted event) {
    bookSearchBloc.add(SearchInitiated(event.query));
  }

  void _onSuggestionsPicked(SuggestionPicked event) {
    bookSearchBloc.add(SuggestedBookPicked(event.book));
  }

  void _onSaveBookStarted(SaveBookStarted event) {
    booksBloc.add(SaveBook(event.book, event.bookState, event.selectedTags));
    bookSearchBloc.add(ClearPickedBook());
    shareBookBloc.add(ClearSharedBook());
    onBookTagsBloc.add(ClearSelectedTags());
  }
}
