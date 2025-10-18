import '../../features/find_new_book/presentation/bloc/search/book_search_bloc.dart';
import '../../features/find_new_book/presentation/bloc/search/book_search_event.dart';
import '../../features/find_new_book/presentation/bloc/share_book/share_book_bloc.dart';
import '../../features/find_new_book/presentation/bloc/share_book/share_book_event.dart';
import '../../features/find_new_book/presentation/bloc/toggle_tags/on_book_tags_bloc.dart';
import '../../features/find_new_book/presentation/bloc/toggle_tags/on_book_tags_event.dart';
import '../../features/import_export/presentation/bloc/import_export_bloc.dart';
import '../../features/import_export/presentation/bloc/import_export_event.dart';
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
import '../entities/book.dart';
import 'bus.dart';
import 'events.dart';

final class Orchestrator {
  Orchestrator({
    required this.eventBus,
    required this.appTab,
    required this.importExport,
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

    // Import Export
    eventBus.on<ImportTriggered>(_onImportTriggered);
    eventBus.on<ImportFinished>(_onImportFinished);
    eventBus.on<ExportTriggered>(_onExportTriggered);

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
    eventBus.on<TagToggled>(_onTagToggled);
    eventBus.on<BookSwiped>(_onSwiped);

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
    eventBus.on<BookStateUpdated>(_onBookStateUpdated);

    // Bottom Drawer
    eventBus.on<BookSharedFromOutside>(_onBookSharedFromOutside);
  }

  final Bus eventBus;

  final AppTabBloc appTab;

  final ImportExportBloc importExport;

  final StatsBloc stats;

  final BooksBloc books;

  final BookSearchBloc search;

  final ShareBookBloc share;

  final OnBookTagsBloc onBookTags;

  final DeleteBooksBloc delete;

  final BookSummaryBloc summary;

  final SettingsBloc settings;

  // AppTab
  void _onTabChanged(TabChanged event) => appTab.add(event);

  // Import Export
  void _onImportTriggered(ImportTriggered event) => importExport.add(event);

  void _onImportFinished(ImportFinished event) {
    stats.add(LoadStats());
    books.add(RefreshBooksList());
  }

  void _onExportTriggered(ExportTriggered event) => importExport.add(event);

  // Find new Book
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

  // Delete
  void _onDeleteModeToggled(DeleteModeToggled event) => delete.add(event);
  void _onClearDeletionList(ClearDeletionList event) => delete.add(event);
  void _onDeletePickedBooks(DeletePickedBooks event) => delete.add(event);

  void _onDeleteBooksFinished(_) {
    books.add(RefreshBooksList());
    stats.add(LoadStats());
  }

  // Listing
  void _onBooksFiltered(BooksFiltered event) => books.add(event);
  void _onTagToggled(TagToggled event) => books.add(event);
  void _onSwiped(BookSwiped event) => books.add(event);

  // Summary
  void _onSummaryModeToggled(SummaryModeToggled event) => summary.add(event);
  void _onSummaryModeClosing(SummaryModeClosing event) => summary.add(event);
  void _onSummaryModeClosed(SummaryModeClosed event) => summary.add(event);

  // Settings
  void _onSizeLimitsChanged(SizeLimitsChanged event) => settings.add(event);
  void _onReadingGoalChanged(ReadingGoalChanged event) => settings.add(event);
  void _onThemeToggled(ThemeToggled event) => settings.add(event);
  void _onSystemThemeEnabled(SystemThemeToggled event) => settings.add(event);

  // Stats
  void _onBookStateUpdated(BookStateUpdated event) {
    assert(switch ((event.direction, event.oldBook.state)) {
      (Swiped.right, BookState.read) => false,
      (Swiped.left, BookState.readLater) => false,
      _ => true,
    }, 'Invalid swipe for current book state.');

    final stat = switch ((event.direction, event.updatedBook.state)) {
      (Swiped.right, BookState.read) => BookFinished(event.updatedBook),
      (Swiped.right, BookState.reading) => BookStarted(),
      (Swiped.left, BookState.reading) => BookUnfinished(event.oldBook),
      (Swiped.left, BookState.readLater) => BookUnstarted(),
      _ => null,
    };

    if (stat != null) stats.add(stat);
  }

  // Bottom Drawer
  void _onBookSharedFromOutside(BookSharedFromOutside event) =>
      share.add(event);
}
