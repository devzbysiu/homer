import '../../features/backup_and_restore/presentation/bloc/backup_bloc.dart';
import '../../features/find_new_book/presentation/bloc/search/book_search_bloc.dart';
import '../../features/find_new_book/presentation/bloc/share_book/share_book_bloc.dart';
import '../../features/find_new_book/presentation/bloc/toggle_tags/on_book_tags_bloc.dart';
import '../../features/manage_books/presentation/bloc/delete/delete_books_bloc.dart';
import '../../features/manage_books/presentation/bloc/listing/books_bloc.dart';
import '../../features/manage_books/presentation/bloc/navigation/app_tab_bloc.dart';
import '../../features/manage_books/presentation/bloc/summary/book_summary_bloc.dart';
import '../../features/settings/presentation/bloc/settings_bloc.dart';
import '../../features/stats/presentation/bloc/stats_bloc.dart';
import 'bus.dart';
import 'events.dart';

// TODO: Make event names consistent (maybe get rid of two types of events
// - for bus and for blocs - and just use one event)
// TODO: Make formatting of two named parameters consistent (one line vs two lines)
final class Orchestrator {
  Orchestrator({
    required this.eventBus,
    required this.appTabBloc,
    required this.backupBloc,
    required this.booksBloc,
    required this.bookSearchBloc,
    required this.shareBookBloc,
    required this.onBookTagsBloc,
    required this.deleteBooksBloc,
    required this.bookSummaryBloc,
    required this.settingsBloc,
    required this.statsBloc,
  }) {
    // AppTab
    eventBus.on<TabTapped>(_onTabTapped);

    // Backup and Restore
    eventBus.on<RestoreStarted>(_onRestoreStarted);
    eventBus.on<RestoreFinished>(_onRestoreFinished);
    eventBus.on<BackupStarted>(_onBackupStarted);

    // Find new Book
    eventBus.on<SearchStarted>(_onSearchStarted);
    eventBus.on<SuggestionPicked>(_onSuggestionsPicked);
    eventBus.on<SaveBookStarted>(_onSaveBookStarted);

    // Delete
    eventBus.on<DeleteModeToggled>(_onDeleteModeToggled);
    eventBus.on<DeleteModeExited>(_onDeleteModeExited);
    eventBus.on<DeleteBooksStarted>(_onDeleteBooksStarted);
    eventBus.on<DeleteBooksFinished>(_onDeleteBooksFinished);

    // Listing
    eventBus.on<FilteringStarted>(_onFilteringStarted);
    eventBus.on<SwipedToRight>(_onSwipedToRight);
    eventBus.on<SwipedToLeft>(_onSwipedToLeft);
    eventBus.on<TagAdded>(_onTagAdded);

    // Summary
    eventBus.on<SummaryModeEntered>(_onSummaryModeEntered);
    eventBus.on<SummaryModeClosing>(_onSummaryModeClosing);
    eventBus.on<SummaryModeClosed>(_onSummaryModeClosed);

    // Settings
    eventBus.on<BackupDirPicked>(_onBackupDirPicked);
    eventBus.on<SizeLimitsChanged>(_onSizeLimitsChanged);
    eventBus.on<GoalChanged>(_onGoalChanged);
    eventBus.on<ThemeChanged>(_onThemeChanged);
    eventBus.on<SystemThemeEnabled>(_onSystemThemeEnabled);

    // Stats
    eventBus.on<BookRead>(_onBookRead);
    eventBus.on<BookReading>(_onBookReading);
    eventBus.on<BookUnread>(_onBookUnread);
    eventBus.on<BookUnreading>(_onBookUnreading);
  }

  final Bus eventBus;

  final AppTabBloc appTabBloc;

  final BackupBloc backupBloc;

  final StatsBloc statsBloc;

  final BooksBloc booksBloc;

  final BookSearchBloc bookSearchBloc;

  final ShareBookBloc shareBookBloc;

  final OnBookTagsBloc onBookTagsBloc;

  final DeleteBooksBloc deleteBooksBloc;

  final BookSummaryBloc bookSummaryBloc;

  final SettingsBloc settingsBloc;

  void _onTabTapped(TabTapped event) {
    appTabBloc.add(TabChanged(event.tab));
  }

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

  void _onDeleteModeToggled(DeleteModeToggled event) {
    deleteBooksBloc.add(ToggleBookOnDeleteList(event.book));
  }

  void _onDeleteModeExited(DeleteModeExited event) {
    deleteBooksBloc.add(ClearDeletionList());
  }

  void _onDeleteBooksStarted(DeleteBooksStarted event) {
    deleteBooksBloc.add(DeletePickedBooks());
  }

  void _onDeleteBooksFinished(DeleteBooksFinished event) {
    booksBloc.add(RefreshBooksList());
  }

  void _onFilteringStarted(FilteringStarted event) {
    booksBloc.add(BooksFiltered(event.query));
  }

  void _onSwipedToRight(SwipedToRight event) {
    booksBloc.add(BookSwipedRight(event.book));
  }

  void _onSwipedToLeft(SwipedToLeft event) {
    booksBloc.add(BookSwipedLeft(event.book));
  }

  void _onTagAdded(TagAdded event) {
    booksBloc.add(TagToggled(event.book, event.tag));
  }

  void _onSummaryModeEntered(SummaryModeEntered event) {
    bookSummaryBloc.add(SummaryModeToggled(event.book));
  }

  void _onSummaryModeClosing(SummaryModeClosing event) {
    bookSummaryBloc.add(SummaryModeDisabling());
  }

  void _onSummaryModeClosed(SummaryModeClosed event) {
    bookSummaryBloc.add(SummaryModeDisabled());
  }

  void _onBackupDirPicked(BackupDirPicked event) {
    settingsBloc.add(BackupsDirectorySelected(event.dir));
  }

  void _onSizeLimitsChanged(SizeLimitsChanged event) {
    settingsBloc.add(BookSizeLimitsChanged(event.limits));
  }

  void _onGoalChanged(GoalChanged event) {
    settingsBloc.add(ReadingGoalChanged(event.goal));
  }

  void _onThemeChanged(ThemeChanged event) {
    settingsBloc.add(ThemeToggled());
  }

  void _onSystemThemeEnabled(SystemThemeEnabled event) {
    settingsBloc.add(SystemThemeToggled());
  }

  void _onBookRead(BookRead event) {
    statsBloc.add(BookFinished(event.book));
  }

  void _onBookReading(BookReading event) {
    statsBloc.add(BookStarted());
  }

  void _onBookUnread(BookUnread event) {
    statsBloc.add(BookUnfinished(event.book));
  }

  void _onBookUnreading(BookUnreading event) {
    statsBloc.add(BookUnstarted());
  }
}
