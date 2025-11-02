import '../../features/find_new_book/presentation/bloc/search/book_search_bloc.dart';
import '../../features/find_new_book/presentation/bloc/search/book_search_event.dart';
import '../../features/find_new_book/presentation/bloc/share_book/share_book_bloc.dart';
import '../../features/find_new_book/presentation/bloc/share_book/share_book_event.dart';
import '../../features/find_new_book/presentation/bloc/toggle_tags/on_book_tags_bloc.dart';
import '../../features/find_new_book/presentation/bloc/toggle_tags/on_book_tags_event.dart';
import '../../features/import_export/presentation/bloc/import_export_bloc.dart';
import '../../features/manage_books/presentation/bloc/delete/delete_books_bloc.dart';
import '../../features/manage_books/presentation/bloc/listing/books_bloc.dart';
import '../../features/manage_books/presentation/bloc/listing/books_event.dart';
import '../../features/manage_books/presentation/bloc/navigation/app_tab_bloc.dart';
import '../../features/manage_books/presentation/bloc/summary/book_summary_bloc.dart';
import '../../features/settings/presentation/bloc/settings_bloc.dart';
import '../../features/stats/presentation/bloc/stats_bloc.dart';
import '../../features/stats/presentation/bloc/stats_event.dart';
import '../entities/book.dart';
import 'bus.dart';
import 'event_mappers.dart';
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
    eventBus.on<$TabChanged>(_onTabChanged);

    // Import Export
    eventBus.on<$ImportTriggered>(_onImportTriggered);
    eventBus.on<$ImportFinished>(_onImportFinished);
    eventBus.on<$ExportTriggered>(_onExportTriggered);

    // Find new Book
    eventBus.on<$Searching>(_onSearching);
    eventBus.on<$ShareOffloaded>(_onShareOffloaded);
    eventBus.on<$ResetShareOffload>(_onResetShareOffload);
    eventBus.on<$SuggestionPicked>(_onSuggestionPicked);

    // Delete
    eventBus.on<$DeleteModeToggled>(_onDeleteModeToggled);
    eventBus.on<$ClearDeletionList>(_onClearDeletionList);
    eventBus.on<$DeletePickedBooks>(_onDeletePickedBooks);
    eventBus.on<$DeleteBooksFinished>(_onDeleteBooksFinished);

    // Listing
    eventBus.on<$BooksFiltered>(_onBooksFiltered);
    eventBus.on<$TagToggled>(_onTagToggled);
    eventBus.on<$BookSwiped>(_onSwiped);
    eventBus.on<$SaveBook>(_onSaveBook);

    // Summary
    eventBus.on<$SummaryModeToggled>(_onSummaryModeToggled);
    eventBus.on<$SummaryModeClosing>(_onSummaryModeClosing);
    eventBus.on<$SummaryModeClosed>(_onSummaryModeClosed);

    // Settings
    eventBus.on<$SizeLimitsChanged>(_onSizeLimitsChanged);
    eventBus.on<$ReadingGoalChanged>(_onReadingGoalChanged);
    eventBus.on<$ThemeToggled>(_onThemeToggled);
    eventBus.on<$SystemThemeToggled>(_onSystemThemeEnabled);

    // Stats
    eventBus.on<$BookStateUpdated>(_onBookStateUpdated);

    // Bottom Drawer
    eventBus.on<$BookSharedFromOutside>(_onBookSharedFromOutside);
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
  void _onTabChanged($TabChanged e) => appTab.add(e.into());

  // Import Export
  void _onImportTriggered($ImportTriggered e) => importExport.add(e.into());

  void _onImportFinished($ImportFinished _) {
    stats.add(LoadStats());
    books.add(RefreshBooksList());
  }

  void _onExportTriggered($ExportTriggered e) => importExport.add(e.into());

  // Find new Book
  void _onSearching($Searching e) {
    search.add(e.into());
    // reset error if happened
    if (share.state.failedToLookUpSharedBook) {
      share.add(ClearSharedBook());
    }
  }

  void _onShareOffloaded($ShareOffloaded e) => search.add(e.into());
  void _onResetShareOffload($ResetShareOffload e) => search.add(e.into());
  void _onSuggestionPicked($SuggestionPicked e) => search.add(e.into());

  void _onSaveBook($SaveBook e) {
    books.add(e.into());
    search.add(ClearPickedBook());
    share.add(ClearSharedBook());
    onBookTags.add(ClearSelectedTags());
  }

  // Delete
  void _onDeleteModeToggled($DeleteModeToggled e) => delete.add(e.into());
  void _onClearDeletionList($ClearDeletionList e) => delete.add(e.into());
  void _onDeletePickedBooks($DeletePickedBooks e) => delete.add(e.into());

  void _onDeleteBooksFinished(_) {
    books.add(RefreshBooksList());
    stats.add(LoadStats());
  }

  // Listing
  void _onBooksFiltered($BooksFiltered e) => books.add(e.into());
  void _onTagToggled($TagToggled e) => books.add(e.into());
  void _onSwiped($BookSwiped e) => books.add(e.into());

  // Summary
  void _onSummaryModeToggled($SummaryModeToggled e) => summary.add(e.into());
  void _onSummaryModeClosing($SummaryModeClosing e) => summary.add(e.into());
  void _onSummaryModeClosed($SummaryModeClosed e) => summary.add(e.into());

  // Settings
  void _onSizeLimitsChanged($SizeLimitsChanged e) => settings.add(e.into());
  void _onReadingGoalChanged($ReadingGoalChanged e) => settings.add(e.into());
  void _onThemeToggled($ThemeToggled e) => settings.add(e.into());
  void _onSystemThemeEnabled($SystemThemeToggled e) => settings.add(e.into());

  // Stats
  void _onBookStateUpdated($BookStateUpdated e) {
    assert(switch ((e.direction, e.oldBook.state)) {
      (Swiped.right, BookState.read) => false,
      (Swiped.left, BookState.readLater) => false,
      _ => true,
    }, 'Invalid swipe for current book state.');

    final stat = switch ((e.direction, e.updatedBook.state)) {
      (Swiped.right, BookState.read) => BookFinished(e.updatedBook),
      (Swiped.right, BookState.reading) => BookStarted(),
      (Swiped.left, BookState.reading) => BookUnfinished(e.oldBook),
      (Swiped.left, BookState.readLater) => BookUnstarted(),
      _ => null,
    };

    if (stat != null) stats.add(stat);
  }

  // Bottom Drawer
  void _onBookSharedFromOutside($BookSharedFromOutside e) =>
      share.add(e.into());
}
