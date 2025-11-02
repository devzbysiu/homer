import 'package:freezed_annotation/freezed_annotation.dart';

import '../../features/manage_books/presentation/bloc/navigation/app_tab_state.dart';
import '../../features/settings/domain/entities/book_size_limits.dart';
import '../../features/settings/domain/entities/reading_goal.dart';
import '../entities/book.dart';
import '../entities/tag.dart';

part 'events.freezed.dart';

@freezed
sealed class BusEvent with _$BusEvent {
  // AppTab
  const factory BusEvent.$tabChanged({required AppTab selectedTab}) =
      $TabChanged;

  // Import Export
  const factory BusEvent.$importTriggered({required String path}) =
      $ImportTriggered;
  const factory BusEvent.$importFinished() = $ImportFinished;
  const factory BusEvent.$exportTriggered({required String path}) =
      $ExportTriggered;

  // Find new Book
  const factory BusEvent.$searching({required String query}) = $Searching;
  const factory BusEvent.$shareOffloaded({required String query}) =
      $ShareOffloaded;
  const factory BusEvent.$resetShareOffload() = $ResetShareOffload;
  const factory BusEvent.$suggestionPicked({required Book pickedBook}) =
      $SuggestionPicked;
  const factory BusEvent.$saveBook({
    required Book book,
    required BookState bookState,
    required List<Tag> selectedTags,
  }) = $SaveBook;

  // Delete
  const factory BusEvent.$deleteBooksFinished() = $DeleteBooksFinished;
  const factory BusEvent.$deletePickedBooks() = $DeletePickedBooks;
  const factory BusEvent.$clearDeletionList() = $ClearDeletionList;
  const factory BusEvent.$deleteModeToggled({required Book book}) =
      $DeleteModeToggled;

  // Listing
  const factory BusEvent.$booksFiltered({required String query}) =
      $BooksFiltered;
  const factory BusEvent.$tagToggled({required Book book, required Tag tag}) =
      $TagToggled;
  const factory BusEvent.$bookSwiped({
    required Book book,
    required Swiped dir,
  }) = $BookSwiped;

  // Summary
  const factory BusEvent.$summaryModeClosing() = $SummaryModeClosing;
  const factory BusEvent.$summaryModeToggled({required Book book}) =
      $SummaryModeToggled;
  const factory BusEvent.$summaryModeClosed() = $SummaryModeClosed;

  // Settings
  const factory BusEvent.$themeToggled() = $ThemeToggled;
  const factory BusEvent.$systemThemeToggled() = $SystemThemeToggled;
  const factory BusEvent.$sizeLimitsChanged({required BookSizeLimits limits}) =
      $SizeLimitsChanged;
  const factory BusEvent.$readingGoalChanged({required ReadingGoal goal}) =
      $ReadingGoalChanged;

  // Stats
  const factory BusEvent.$bookStateUpdated({
    required Book oldBook,
    required Swiped direction,
    required Book updatedBook,
  }) = $BookStateUpdated;

  // Bottom Drawer
  const factory BusEvent.$bookSharedFromOutside({required String url}) =
      $BookSharedFromOutside;
  const factory BusEvent.$clearSharedBook() = $ClearSharedBook;
}
