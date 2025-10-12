import '../../features/backup_and_restore/presentation/bloc/backup_bloc.dart';
import '../../features/backup_and_restore/presentation/bloc/backup_event.dart';
import '../../features/find_new_book/presentation/bloc/search/book_search_bloc.dart';
import '../../features/find_new_book/presentation/bloc/search/book_search_event.dart';
import '../../features/find_new_book/presentation/bloc/share_book/share_book_bloc.dart';
import '../../features/find_new_book/presentation/bloc/share_book/share_book_event.dart';
import '../../features/find_new_book/presentation/bloc/toggle_tags/on_book_tags_bloc.dart';
import '../../features/find_new_book/presentation/bloc/toggle_tags/on_book_tags_event.dart';
import '../../features/manage_books/presentation/bloc/delete/delete_books_bloc.dart';
import '../../features/manage_books/presentation/bloc/delete/delete_books_event.dart';
import '../../features/manage_books/presentation/bloc/listing/books_bloc.dart';
import '../../features/manage_books/presentation/bloc/listing/books_event.dart';
import '../../features/manage_books/presentation/bloc/navigation/app_tab_bloc.dart';
import '../../features/manage_books/presentation/bloc/navigation/app_tab_event.dart';
import '../../features/manage_books/presentation/bloc/summary/book_summary_bloc.dart';
import '../../features/manage_books/presentation/bloc/summary/book_summary_event.dart';
import '../../features/settings/presentation/bloc/settings_bloc.dart';
import '../../features/settings/presentation/bloc/settings_event.dart';
import '../../features/stats/presentation/bloc/stats_bloc.dart';
import '../../features/stats/presentation/bloc/stats_event.dart';
import 'bus.dart';
import 'events.dart';

final class Orchestrator {
  Orchestrator({
    required this.eventBus,
    required this.appTab,
    required this.backup,
    required this.books,
    required this.search,
    required this.share,
    required this.onBookTags,
    required this.delete,
    required this.summary,
    required this.settings,
    required this.stats,
  }) {
    // AppTab
    eventBus.on<TabChanged>(_onTabChanged);

    // Backup and Restore
    eventBus.on<RestoreTriggered>(_onRestoreTriggered);
    eventBus.on<RestoreFinished>(_onRestoreFinished);
    eventBus.on<BackupTriggered>(_onBackupTriggered);

    // Find new Book
    eventBus.on<Searching>(_onSearching);
    eventBus.on<ShareOffloaded>(_onShareOffloaded);
    eventBus.on<ResetShareOffload>(_onResetShareOffload);
    eventBus.on<SuggestionPicked>(_onSuggestionPicked);
    eventBus.on<SaveBook>(_onSaveBookStarted);

    // Delete
    eventBus.on<DeleteModeToggled>(_onDeleteModeToggled);
    eventBus.on<ClearDeletionList>(_onClearDeletionList);
    eventBus.on<DeletePickedBooks>(_onDeletePickedBooks);
    eventBus.on<DeleteBooksFinished>(_onDeleteBooksFinished);

    // Listing
    eventBus.on<BooksFiltered>(_onBooksFiltered);
    eventBus.on<BookSwipedRight>(_onSwipedRight);
    eventBus.on<BookSwipedLeft>(_onSwipedLeft);
    eventBus.on<TagToggled>(_onTagToggled);

    // Summary
    eventBus.on<SummaryModeToggled>(_onSummaryModeToggled);
    eventBus.on<SummaryModeClosing>(_onSummaryModeClosing);
    eventBus.on<SummaryModeClosed>(_onSummaryModeClosed);

    // Settings
    eventBus.on<SizeLimitsChanged>(_onSizeLimitsChanged);
    eventBus.on<ReadingGoalChanged>(_onReadingGoalChanged);
    eventBus.on<ThemeToggled>(_onThemeToggled);
    eventBus.on<SystemThemeToggled>(_onSystemThemeEnabled);

    // Stats
    eventBus.on<BookFinished>(_onBookFinished);
    eventBus.on<BookStarted>(_onBookStarted);
    eventBus.on<BookUnfinished>(_onBookUnfinished);
    eventBus.on<BookUnstarted>(_onBookUnstarted);

    // Bottom Drawer
    eventBus.on<BookSharedFromOutside>(_onBookSharedFromOutside);
  }

  final Bus eventBus;

  final AppTabBloc appTab;

  final BackupBloc backup;

  final StatsBloc stats;

  final BooksBloc books;

  final BookSearchBloc search;

  final ShareBookBloc share;

  final OnBookTagsBloc onBookTags;

  final DeleteBooksBloc delete;

  final BookSummaryBloc summary;

  final SettingsBloc settings;

  void _onTabChanged(TabChanged event) => appTab.add(event);

  void _onRestoreTriggered(RestoreTriggered event) => backup.add(event);

  void _onRestoreFinished(RestoreFinished event) {
    stats.add(LoadStats());
    books.add(RefreshBooksList());
  }

  void _onBackupTriggered(BackupTriggered event) => backup.add(event);

  void _onSearching(Searching event) {
    search.add(event);
    // reset error if happened
    if (share.state.failedToLookUpSharedBook) {
      share.add(ClearSharedBook());
    }
  }

  void _onShareOffloaded(ShareOffloaded event) => search.add(event);
  void _onResetShareOffload(ResetShareOffload event) => search.add(event);
  void _onSuggestionPicked(SuggestionPicked event) => search.add(event);

  void _onSaveBookStarted(SaveBook event) {
    books.add(event);
    search.add(ClearPickedBook());
    share.add(ClearSharedBook());
    onBookTags.add(ClearSelectedTags());
  }

  void _onDeleteModeToggled(DeleteModeToggled event) => delete.add(event);
  void _onClearDeletionList(ClearDeletionList event) => delete.add(event);
  void _onDeletePickedBooks(DeletePickedBooks event) => delete.add(event);

  void _onDeleteBooksFinished(_) {
    books.add(RefreshBooksList());
    stats.add(LoadStats());
  }

  void _onBooksFiltered(BooksFiltered event) => books.add(event);
  void _onSwipedRight(BookSwipedRight event) => books.add(event);
  void _onSwipedLeft(BookSwipedLeft event) => books.add(event);
  void _onTagToggled(TagToggled event) => books.add(event);

  void _onSummaryModeToggled(SummaryModeToggled event) => summary.add(event);
  void _onSummaryModeClosing(SummaryModeClosing event) => summary.add(event);
  void _onSummaryModeClosed(SummaryModeClosed event) => summary.add(event);

  void _onSizeLimitsChanged(SizeLimitsChanged event) => settings.add(event);
  void _onReadingGoalChanged(ReadingGoalChanged event) => settings.add(event);
  void _onThemeToggled(ThemeToggled event) => settings.add(event);
  void _onSystemThemeEnabled(SystemThemeToggled event) => settings.add(event);

  void _onBookFinished(BookFinished event) => stats.add(event);
  void _onBookStarted(BookStarted event) => stats.add(event);
  void _onBookUnfinished(BookUnfinished event) => stats.add(event);
  void _onBookUnstarted(BookUnstarted event) => stats.add(event);

  void _onBookSharedFromOutside(BookSharedFromOutside event) =>
      share.add(event);
}
