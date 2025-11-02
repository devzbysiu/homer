// AppTab
import '../../features/find_new_book/presentation/bloc/search/book_search_event.dart';
import '../../features/find_new_book/presentation/bloc/share_book/share_book_event.dart';
import '../../features/import_export/presentation/bloc/import_export_event.dart';
import '../../features/manage_books/presentation/bloc/delete/delete_books_event.dart';
import '../../features/manage_books/presentation/bloc/listing/books_event.dart';
import '../../features/manage_books/presentation/bloc/navigation/app_tab_event.dart';
import '../../features/manage_books/presentation/bloc/summary/book_summary_event.dart';
import '../../features/settings/presentation/bloc/settings_event.dart';
import 'events.dart';

extension $TabChangedInto on $TabChanged {
  TabChanged into() => TabChanged(selectedTab: selectedTab);
}

// Import Export
extension $ImportTriggeredInto on $ImportTriggered {
  ImportTriggered into() => ImportTriggered(path: path);
}

extension $ExportTriggeredInto on $ExportTriggered {
  ExportTriggered into() => ExportTriggered(path: path);
}

// Find new Book
extension $SearchingInto on $Searching {
  Searching into() => Searching(query: query);
}

extension $ShareOffloadedInto on $ShareOffloaded {
  ShareOffloaded into() => ShareOffloaded(query: query);
}

extension $ResetShareOffloadInto on $ResetShareOffload {
  ResetShareOffload into() => ResetShareOffload();
}

extension $SuggestionPickedInto on $SuggestionPicked {
  SuggestionPicked into() => SuggestionPicked(pickedBook: pickedBook);
}

extension $SaveBookInto on $SaveBook {
  SaveBook into() =>
      SaveBook(book: book, bookState: bookState, selectedTags: selectedTags);
}

// Delete
extension $DeleteModeToggledInto on $DeleteModeToggled {
  DeleteModeToggled into() => DeleteModeToggled(book: book);
}

extension $ClearDeletionListInto on $ClearDeletionList {
  ClearDeletionList into() => ClearDeletionList();
}

extension $DeletePickedBooksInto on $DeletePickedBooks {
  DeletePickedBooks into() => DeletePickedBooks();
}

// Listing
extension $BooksFilteredInto on $BooksFiltered {
  BooksFiltered into() => BooksFiltered(query: query);
}

extension $TagToggledInto on $TagToggled {
  TagToggled into() => TagToggled(book: book, tag: tag);
}

extension $BookSwipedInto on $BookSwiped {
  BookSwiped into() => BookSwiped(book: book, dir: dir);
}

// Summary
extension $SummaryModeToggledInto on $SummaryModeToggled {
  SummaryModeToggled into() => SummaryModeToggled(book: book);
}

extension $SummaryModeClosingInto on $SummaryModeClosing {
  SummaryModeClosing into() => SummaryModeClosing();
}

extension $SummaryModeClosedInto on $SummaryModeClosed {
  SummaryModeClosed into() => SummaryModeClosed();
}

// Settings
extension $SizeLimitsChangedInto on $SizeLimitsChanged {
  SizeLimitsChanged into() => SizeLimitsChanged(limits: limits);
}

extension $ReadingGoalChangedInto on $ReadingGoalChanged {
  ReadingGoalChanged into() => ReadingGoalChanged(goal: goal);
}

extension $ThemeToggledInto on $ThemeToggled {
  ThemeToggled into() => ThemeToggled();
}

extension $SystemThemeToggledInto on $SystemThemeToggled {
  SystemThemeToggled into() => SystemThemeToggled();
}

// Bottom Drawer
extension $BookSharedFromOutsideInto on $BookSharedFromOutside {
  BookSharedFromOutside into() => BookSharedFromOutside(url: url);
}
