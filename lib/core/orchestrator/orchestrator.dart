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
    eventBus.on<$TabChanged>(_onTabChanged);

    // Import Export
    eventBus.on<$ImportTriggered>(_onImportTriggered);
    eventBus.on<$ImportFinished>(_onImportFinished);
    eventBus.on<$ExportTriggered>(_onExportTriggered);

    // Find new Book
    eventBus.on<$Searching>(_onSearching);
    eventBus.on<$ShareOffloaded>(_onShareOffloaded);
    eventBus.on<$ResetShareOffloaded>(_onResetShareOffload);
    eventBus.on<$SuggestionPicked>(_onSuggestionPicked);
    // TODO: Is this in the correct BLoC?
    eventBus.on<$SaveBook>(_onSaveBookStarted);

    // Delete
    eventBus.on<$DeleteModeToggled>(_onDeleteModeToggled);
    eventBus.on<$ClearDeletionList>(_onClearDeletionList);
    eventBus.on<$DeletePickedBooks>(_onDeletePickedBooks);
    eventBus.on<$DeleteBooksFinished>(_onDeleteBooksFinished);

    // Listing
    eventBus.on<$BooksFiltered>(_onBooksFiltered);
    eventBus.on<$TagToggled>(_onTagToggled);
    eventBus.on<$BookSwiped>(_onSwiped);

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
  void _onTabChanged($TabChanged event) =>
      appTab.add(TabChanged(selectedTab: event.selectedTab));

  // Import Export
  void _onImportTriggered($ImportTriggered event) =>
      importExport.add(ImportTriggered(path: event.path));

  void _onImportFinished($ImportFinished _) {
    stats.add(LoadStats());
    books.add(RefreshBooksList());
  }

  void _onExportTriggered($ExportTriggered event) =>
      importExport.add(ExportTriggered(path: event.path));

  // Find new Book
  void _onSearching($Searching event) {
    search.add(Searching(query: event.query));
    // reset error if happened
    if (share.state.failedToLookUpSharedBook) {
      share.add(ClearSharedBook());
    }
  }

  void _onShareOffloaded($ShareOffloaded event) =>
      search.add(ShareOffloaded(query: event.query));
  void _onResetShareOffload($ResetShareOffloaded _) =>
      search.add(ResetShareOffload());
  void _onSuggestionPicked($SuggestionPicked event) =>
      search.add(SuggestionPicked(pickedBook: event.pickedBook));

  void _onSaveBookStarted($SaveBook event) {
    books.add(
      SaveBook(
        book: event.book,
        bookState: event.bookState,
        selectedTags: event.selectedTags,
      ),
    );
    search.add(ClearPickedBook());
    share.add(ClearSharedBook());
    onBookTags.add(ClearSelectedTags());
  }

  // Delete
  void _onDeleteModeToggled($DeleteModeToggled event) =>
      delete.add(DeleteModeToggled(book: event.book));
  void _onClearDeletionList($ClearDeletionList _) =>
      delete.add(ClearDeletionList());
  void _onDeletePickedBooks($DeletePickedBooks _) =>
      delete.add(DeletePickedBooks());

  void _onDeleteBooksFinished(_) {
    books.add(RefreshBooksList());
    stats.add(LoadStats());
  }

  // Listing
  void _onBooksFiltered($BooksFiltered event) =>
      books.add(BooksFiltered(query: event.query));
  void _onTagToggled($TagToggled event) =>
      books.add(TagToggled(book: event.book, tag: event.tag));
  void _onSwiped($BookSwiped event) =>
      books.add(BookSwiped(book: event.book, dir: event.dir));

  // Summary
  void _onSummaryModeToggled($SummaryModeToggled event) =>
      summary.add(SummaryModeToggled(book: event.book));
  void _onSummaryModeClosing($SummaryModeClosing _) =>
      summary.add(SummaryModeClosing());
  void _onSummaryModeClosed($SummaryModeClosed _) =>
      summary.add(SummaryModeClosed());

  // Settings
  void _onSizeLimitsChanged($SizeLimitsChanged event) =>
      settings.add(SizeLimitsChanged(limits: event.limits));
  void _onReadingGoalChanged($ReadingGoalChanged event) =>
      settings.add(ReadingGoalChanged(goal: event.goal));
  void _onThemeToggled($ThemeToggled _) => settings.add(ThemeToggled());
  void _onSystemThemeEnabled($SystemThemeToggled _) =>
      settings.add(SystemThemeToggled());

  // Stats
  void _onBookStateUpdated($BookStateUpdated event) {
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
  void _onBookSharedFromOutside($BookSharedFromOutside event) =>
      share.add(BookSharedFromOutside(url: event.url));
}
