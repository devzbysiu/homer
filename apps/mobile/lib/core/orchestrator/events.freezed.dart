// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'events.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BusEvent {





@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BusEvent);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BusEvent()';
}


}

/// @nodoc
class $BusEventCopyWith<$Res>  {
$BusEventCopyWith(BusEvent _, $Res Function(BusEvent) __);
}


/// Adds pattern-matching-related methods to [BusEvent].
extension BusEventPatterns on BusEvent {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( $TabChanged value)?  $tabChanged,TResult Function( $ImportTriggered value)?  $importTriggered,TResult Function( $ImportFinished value)?  $importFinished,TResult Function( $ExportTriggered value)?  $exportTriggered,TResult Function( $Searching value)?  $searching,TResult Function( $ShareOffloaded value)?  $shareOffloaded,TResult Function( $ResetShareOffload value)?  $resetShareOffload,TResult Function( $SuggestionPicked value)?  $suggestionPicked,TResult Function( $SaveBook value)?  $saveBook,TResult Function( $DeleteBooksFinished value)?  $deleteBooksFinished,TResult Function( $DeletePickedBooks value)?  $deletePickedBooks,TResult Function( $ClearDeletionList value)?  $clearDeletionList,TResult Function( $DeleteModeToggled value)?  $deleteModeToggled,TResult Function( $BooksFiltered value)?  $booksFiltered,TResult Function( $TagToggled value)?  $tagToggled,TResult Function( $BookSwiped value)?  $bookSwiped,TResult Function( $SummaryModeClosing value)?  $summaryModeClosing,TResult Function( $SummaryModeToggled value)?  $summaryModeToggled,TResult Function( $SummaryModeClosed value)?  $summaryModeClosed,TResult Function( $ThemeToggled value)?  $themeToggled,TResult Function( $SystemThemeToggled value)?  $systemThemeToggled,TResult Function( $SizeLimitsChanged value)?  $sizeLimitsChanged,TResult Function( $ReadingGoalChanged value)?  $readingGoalChanged,TResult Function( $BookFinished value)?  $bookFinished,TResult Function( $BookStarted value)?  $bookStarted,TResult Function( $BookUnfinished value)?  $bookUnfinished,TResult Function( $BookUnstarted value)?  $bookUnstarted,TResult Function( $BookSharedFromOutside value)?  $bookSharedFromOutside,TResult Function( $ClearSharedBook value)?  $clearSharedBook,required TResult orElse(),}){
final _that = this;
switch (_that) {
case $TabChanged() when $tabChanged != null:
return $tabChanged(_that);case $ImportTriggered() when $importTriggered != null:
return $importTriggered(_that);case $ImportFinished() when $importFinished != null:
return $importFinished(_that);case $ExportTriggered() when $exportTriggered != null:
return $exportTriggered(_that);case $Searching() when $searching != null:
return $searching(_that);case $ShareOffloaded() when $shareOffloaded != null:
return $shareOffloaded(_that);case $ResetShareOffload() when $resetShareOffload != null:
return $resetShareOffload(_that);case $SuggestionPicked() when $suggestionPicked != null:
return $suggestionPicked(_that);case $SaveBook() when $saveBook != null:
return $saveBook(_that);case $DeleteBooksFinished() when $deleteBooksFinished != null:
return $deleteBooksFinished(_that);case $DeletePickedBooks() when $deletePickedBooks != null:
return $deletePickedBooks(_that);case $ClearDeletionList() when $clearDeletionList != null:
return $clearDeletionList(_that);case $DeleteModeToggled() when $deleteModeToggled != null:
return $deleteModeToggled(_that);case $BooksFiltered() when $booksFiltered != null:
return $booksFiltered(_that);case $TagToggled() when $tagToggled != null:
return $tagToggled(_that);case $BookSwiped() when $bookSwiped != null:
return $bookSwiped(_that);case $SummaryModeClosing() when $summaryModeClosing != null:
return $summaryModeClosing(_that);case $SummaryModeToggled() when $summaryModeToggled != null:
return $summaryModeToggled(_that);case $SummaryModeClosed() when $summaryModeClosed != null:
return $summaryModeClosed(_that);case $ThemeToggled() when $themeToggled != null:
return $themeToggled(_that);case $SystemThemeToggled() when $systemThemeToggled != null:
return $systemThemeToggled(_that);case $SizeLimitsChanged() when $sizeLimitsChanged != null:
return $sizeLimitsChanged(_that);case $ReadingGoalChanged() when $readingGoalChanged != null:
return $readingGoalChanged(_that);case $BookFinished() when $bookFinished != null:
return $bookFinished(_that);case $BookStarted() when $bookStarted != null:
return $bookStarted(_that);case $BookUnfinished() when $bookUnfinished != null:
return $bookUnfinished(_that);case $BookUnstarted() when $bookUnstarted != null:
return $bookUnstarted(_that);case $BookSharedFromOutside() when $bookSharedFromOutside != null:
return $bookSharedFromOutside(_that);case $ClearSharedBook() when $clearSharedBook != null:
return $clearSharedBook(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( $TabChanged value)  $tabChanged,required TResult Function( $ImportTriggered value)  $importTriggered,required TResult Function( $ImportFinished value)  $importFinished,required TResult Function( $ExportTriggered value)  $exportTriggered,required TResult Function( $Searching value)  $searching,required TResult Function( $ShareOffloaded value)  $shareOffloaded,required TResult Function( $ResetShareOffload value)  $resetShareOffload,required TResult Function( $SuggestionPicked value)  $suggestionPicked,required TResult Function( $SaveBook value)  $saveBook,required TResult Function( $DeleteBooksFinished value)  $deleteBooksFinished,required TResult Function( $DeletePickedBooks value)  $deletePickedBooks,required TResult Function( $ClearDeletionList value)  $clearDeletionList,required TResult Function( $DeleteModeToggled value)  $deleteModeToggled,required TResult Function( $BooksFiltered value)  $booksFiltered,required TResult Function( $TagToggled value)  $tagToggled,required TResult Function( $BookSwiped value)  $bookSwiped,required TResult Function( $SummaryModeClosing value)  $summaryModeClosing,required TResult Function( $SummaryModeToggled value)  $summaryModeToggled,required TResult Function( $SummaryModeClosed value)  $summaryModeClosed,required TResult Function( $ThemeToggled value)  $themeToggled,required TResult Function( $SystemThemeToggled value)  $systemThemeToggled,required TResult Function( $SizeLimitsChanged value)  $sizeLimitsChanged,required TResult Function( $ReadingGoalChanged value)  $readingGoalChanged,required TResult Function( $BookFinished value)  $bookFinished,required TResult Function( $BookStarted value)  $bookStarted,required TResult Function( $BookUnfinished value)  $bookUnfinished,required TResult Function( $BookUnstarted value)  $bookUnstarted,required TResult Function( $BookSharedFromOutside value)  $bookSharedFromOutside,required TResult Function( $ClearSharedBook value)  $clearSharedBook,}){
final _that = this;
switch (_that) {
case $TabChanged():
return $tabChanged(_that);case $ImportTriggered():
return $importTriggered(_that);case $ImportFinished():
return $importFinished(_that);case $ExportTriggered():
return $exportTriggered(_that);case $Searching():
return $searching(_that);case $ShareOffloaded():
return $shareOffloaded(_that);case $ResetShareOffload():
return $resetShareOffload(_that);case $SuggestionPicked():
return $suggestionPicked(_that);case $SaveBook():
return $saveBook(_that);case $DeleteBooksFinished():
return $deleteBooksFinished(_that);case $DeletePickedBooks():
return $deletePickedBooks(_that);case $ClearDeletionList():
return $clearDeletionList(_that);case $DeleteModeToggled():
return $deleteModeToggled(_that);case $BooksFiltered():
return $booksFiltered(_that);case $TagToggled():
return $tagToggled(_that);case $BookSwiped():
return $bookSwiped(_that);case $SummaryModeClosing():
return $summaryModeClosing(_that);case $SummaryModeToggled():
return $summaryModeToggled(_that);case $SummaryModeClosed():
return $summaryModeClosed(_that);case $ThemeToggled():
return $themeToggled(_that);case $SystemThemeToggled():
return $systemThemeToggled(_that);case $SizeLimitsChanged():
return $sizeLimitsChanged(_that);case $ReadingGoalChanged():
return $readingGoalChanged(_that);case $BookFinished():
return $bookFinished(_that);case $BookStarted():
return $bookStarted(_that);case $BookUnfinished():
return $bookUnfinished(_that);case $BookUnstarted():
return $bookUnstarted(_that);case $BookSharedFromOutside():
return $bookSharedFromOutside(_that);case $ClearSharedBook():
return $clearSharedBook(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( $TabChanged value)?  $tabChanged,TResult? Function( $ImportTriggered value)?  $importTriggered,TResult? Function( $ImportFinished value)?  $importFinished,TResult? Function( $ExportTriggered value)?  $exportTriggered,TResult? Function( $Searching value)?  $searching,TResult? Function( $ShareOffloaded value)?  $shareOffloaded,TResult? Function( $ResetShareOffload value)?  $resetShareOffload,TResult? Function( $SuggestionPicked value)?  $suggestionPicked,TResult? Function( $SaveBook value)?  $saveBook,TResult? Function( $DeleteBooksFinished value)?  $deleteBooksFinished,TResult? Function( $DeletePickedBooks value)?  $deletePickedBooks,TResult? Function( $ClearDeletionList value)?  $clearDeletionList,TResult? Function( $DeleteModeToggled value)?  $deleteModeToggled,TResult? Function( $BooksFiltered value)?  $booksFiltered,TResult? Function( $TagToggled value)?  $tagToggled,TResult? Function( $BookSwiped value)?  $bookSwiped,TResult? Function( $SummaryModeClosing value)?  $summaryModeClosing,TResult? Function( $SummaryModeToggled value)?  $summaryModeToggled,TResult? Function( $SummaryModeClosed value)?  $summaryModeClosed,TResult? Function( $ThemeToggled value)?  $themeToggled,TResult? Function( $SystemThemeToggled value)?  $systemThemeToggled,TResult? Function( $SizeLimitsChanged value)?  $sizeLimitsChanged,TResult? Function( $ReadingGoalChanged value)?  $readingGoalChanged,TResult? Function( $BookFinished value)?  $bookFinished,TResult? Function( $BookStarted value)?  $bookStarted,TResult? Function( $BookUnfinished value)?  $bookUnfinished,TResult? Function( $BookUnstarted value)?  $bookUnstarted,TResult? Function( $BookSharedFromOutside value)?  $bookSharedFromOutside,TResult? Function( $ClearSharedBook value)?  $clearSharedBook,}){
final _that = this;
switch (_that) {
case $TabChanged() when $tabChanged != null:
return $tabChanged(_that);case $ImportTriggered() when $importTriggered != null:
return $importTriggered(_that);case $ImportFinished() when $importFinished != null:
return $importFinished(_that);case $ExportTriggered() when $exportTriggered != null:
return $exportTriggered(_that);case $Searching() when $searching != null:
return $searching(_that);case $ShareOffloaded() when $shareOffloaded != null:
return $shareOffloaded(_that);case $ResetShareOffload() when $resetShareOffload != null:
return $resetShareOffload(_that);case $SuggestionPicked() when $suggestionPicked != null:
return $suggestionPicked(_that);case $SaveBook() when $saveBook != null:
return $saveBook(_that);case $DeleteBooksFinished() when $deleteBooksFinished != null:
return $deleteBooksFinished(_that);case $DeletePickedBooks() when $deletePickedBooks != null:
return $deletePickedBooks(_that);case $ClearDeletionList() when $clearDeletionList != null:
return $clearDeletionList(_that);case $DeleteModeToggled() when $deleteModeToggled != null:
return $deleteModeToggled(_that);case $BooksFiltered() when $booksFiltered != null:
return $booksFiltered(_that);case $TagToggled() when $tagToggled != null:
return $tagToggled(_that);case $BookSwiped() when $bookSwiped != null:
return $bookSwiped(_that);case $SummaryModeClosing() when $summaryModeClosing != null:
return $summaryModeClosing(_that);case $SummaryModeToggled() when $summaryModeToggled != null:
return $summaryModeToggled(_that);case $SummaryModeClosed() when $summaryModeClosed != null:
return $summaryModeClosed(_that);case $ThemeToggled() when $themeToggled != null:
return $themeToggled(_that);case $SystemThemeToggled() when $systemThemeToggled != null:
return $systemThemeToggled(_that);case $SizeLimitsChanged() when $sizeLimitsChanged != null:
return $sizeLimitsChanged(_that);case $ReadingGoalChanged() when $readingGoalChanged != null:
return $readingGoalChanged(_that);case $BookFinished() when $bookFinished != null:
return $bookFinished(_that);case $BookStarted() when $bookStarted != null:
return $bookStarted(_that);case $BookUnfinished() when $bookUnfinished != null:
return $bookUnfinished(_that);case $BookUnstarted() when $bookUnstarted != null:
return $bookUnstarted(_that);case $BookSharedFromOutside() when $bookSharedFromOutside != null:
return $bookSharedFromOutside(_that);case $ClearSharedBook() when $clearSharedBook != null:
return $clearSharedBook(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( AppTab selectedTab)?  $tabChanged,TResult Function( String path)?  $importTriggered,TResult Function()?  $importFinished,TResult Function( String path)?  $exportTriggered,TResult Function( String query)?  $searching,TResult Function( String query)?  $shareOffloaded,TResult Function()?  $resetShareOffload,TResult Function( Book pickedBook)?  $suggestionPicked,TResult Function( Book book,  BookState bookState,  List<Tag> selectedTags)?  $saveBook,TResult Function()?  $deleteBooksFinished,TResult Function()?  $deletePickedBooks,TResult Function()?  $clearDeletionList,TResult Function( Book book)?  $deleteModeToggled,TResult Function( String query)?  $booksFiltered,TResult Function( Book book,  Tag tag)?  $tagToggled,TResult Function( Book book,  Swiped dir)?  $bookSwiped,TResult Function()?  $summaryModeClosing,TResult Function( Book book)?  $summaryModeToggled,TResult Function()?  $summaryModeClosed,TResult Function()?  $themeToggled,TResult Function()?  $systemThemeToggled,TResult Function( BookSizeLimits limits)?  $sizeLimitsChanged,TResult Function( ReadingGoal goal)?  $readingGoalChanged,TResult Function( Book updatedBook)?  $bookFinished,TResult Function()?  $bookStarted,TResult Function( Book book)?  $bookUnfinished,TResult Function()?  $bookUnstarted,TResult Function( String url)?  $bookSharedFromOutside,TResult Function()?  $clearSharedBook,required TResult orElse(),}) {final _that = this;
switch (_that) {
case $TabChanged() when $tabChanged != null:
return $tabChanged(_that.selectedTab);case $ImportTriggered() when $importTriggered != null:
return $importTriggered(_that.path);case $ImportFinished() when $importFinished != null:
return $importFinished();case $ExportTriggered() when $exportTriggered != null:
return $exportTriggered(_that.path);case $Searching() when $searching != null:
return $searching(_that.query);case $ShareOffloaded() when $shareOffloaded != null:
return $shareOffloaded(_that.query);case $ResetShareOffload() when $resetShareOffload != null:
return $resetShareOffload();case $SuggestionPicked() when $suggestionPicked != null:
return $suggestionPicked(_that.pickedBook);case $SaveBook() when $saveBook != null:
return $saveBook(_that.book,_that.bookState,_that.selectedTags);case $DeleteBooksFinished() when $deleteBooksFinished != null:
return $deleteBooksFinished();case $DeletePickedBooks() when $deletePickedBooks != null:
return $deletePickedBooks();case $ClearDeletionList() when $clearDeletionList != null:
return $clearDeletionList();case $DeleteModeToggled() when $deleteModeToggled != null:
return $deleteModeToggled(_that.book);case $BooksFiltered() when $booksFiltered != null:
return $booksFiltered(_that.query);case $TagToggled() when $tagToggled != null:
return $tagToggled(_that.book,_that.tag);case $BookSwiped() when $bookSwiped != null:
return $bookSwiped(_that.book,_that.dir);case $SummaryModeClosing() when $summaryModeClosing != null:
return $summaryModeClosing();case $SummaryModeToggled() when $summaryModeToggled != null:
return $summaryModeToggled(_that.book);case $SummaryModeClosed() when $summaryModeClosed != null:
return $summaryModeClosed();case $ThemeToggled() when $themeToggled != null:
return $themeToggled();case $SystemThemeToggled() when $systemThemeToggled != null:
return $systemThemeToggled();case $SizeLimitsChanged() when $sizeLimitsChanged != null:
return $sizeLimitsChanged(_that.limits);case $ReadingGoalChanged() when $readingGoalChanged != null:
return $readingGoalChanged(_that.goal);case $BookFinished() when $bookFinished != null:
return $bookFinished(_that.updatedBook);case $BookStarted() when $bookStarted != null:
return $bookStarted();case $BookUnfinished() when $bookUnfinished != null:
return $bookUnfinished(_that.book);case $BookUnstarted() when $bookUnstarted != null:
return $bookUnstarted();case $BookSharedFromOutside() when $bookSharedFromOutside != null:
return $bookSharedFromOutside(_that.url);case $ClearSharedBook() when $clearSharedBook != null:
return $clearSharedBook();case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( AppTab selectedTab)  $tabChanged,required TResult Function( String path)  $importTriggered,required TResult Function()  $importFinished,required TResult Function( String path)  $exportTriggered,required TResult Function( String query)  $searching,required TResult Function( String query)  $shareOffloaded,required TResult Function()  $resetShareOffload,required TResult Function( Book pickedBook)  $suggestionPicked,required TResult Function( Book book,  BookState bookState,  List<Tag> selectedTags)  $saveBook,required TResult Function()  $deleteBooksFinished,required TResult Function()  $deletePickedBooks,required TResult Function()  $clearDeletionList,required TResult Function( Book book)  $deleteModeToggled,required TResult Function( String query)  $booksFiltered,required TResult Function( Book book,  Tag tag)  $tagToggled,required TResult Function( Book book,  Swiped dir)  $bookSwiped,required TResult Function()  $summaryModeClosing,required TResult Function( Book book)  $summaryModeToggled,required TResult Function()  $summaryModeClosed,required TResult Function()  $themeToggled,required TResult Function()  $systemThemeToggled,required TResult Function( BookSizeLimits limits)  $sizeLimitsChanged,required TResult Function( ReadingGoal goal)  $readingGoalChanged,required TResult Function( Book updatedBook)  $bookFinished,required TResult Function()  $bookStarted,required TResult Function( Book book)  $bookUnfinished,required TResult Function()  $bookUnstarted,required TResult Function( String url)  $bookSharedFromOutside,required TResult Function()  $clearSharedBook,}) {final _that = this;
switch (_that) {
case $TabChanged():
return $tabChanged(_that.selectedTab);case $ImportTriggered():
return $importTriggered(_that.path);case $ImportFinished():
return $importFinished();case $ExportTriggered():
return $exportTriggered(_that.path);case $Searching():
return $searching(_that.query);case $ShareOffloaded():
return $shareOffloaded(_that.query);case $ResetShareOffload():
return $resetShareOffload();case $SuggestionPicked():
return $suggestionPicked(_that.pickedBook);case $SaveBook():
return $saveBook(_that.book,_that.bookState,_that.selectedTags);case $DeleteBooksFinished():
return $deleteBooksFinished();case $DeletePickedBooks():
return $deletePickedBooks();case $ClearDeletionList():
return $clearDeletionList();case $DeleteModeToggled():
return $deleteModeToggled(_that.book);case $BooksFiltered():
return $booksFiltered(_that.query);case $TagToggled():
return $tagToggled(_that.book,_that.tag);case $BookSwiped():
return $bookSwiped(_that.book,_that.dir);case $SummaryModeClosing():
return $summaryModeClosing();case $SummaryModeToggled():
return $summaryModeToggled(_that.book);case $SummaryModeClosed():
return $summaryModeClosed();case $ThemeToggled():
return $themeToggled();case $SystemThemeToggled():
return $systemThemeToggled();case $SizeLimitsChanged():
return $sizeLimitsChanged(_that.limits);case $ReadingGoalChanged():
return $readingGoalChanged(_that.goal);case $BookFinished():
return $bookFinished(_that.updatedBook);case $BookStarted():
return $bookStarted();case $BookUnfinished():
return $bookUnfinished(_that.book);case $BookUnstarted():
return $bookUnstarted();case $BookSharedFromOutside():
return $bookSharedFromOutside(_that.url);case $ClearSharedBook():
return $clearSharedBook();}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( AppTab selectedTab)?  $tabChanged,TResult? Function( String path)?  $importTriggered,TResult? Function()?  $importFinished,TResult? Function( String path)?  $exportTriggered,TResult? Function( String query)?  $searching,TResult? Function( String query)?  $shareOffloaded,TResult? Function()?  $resetShareOffload,TResult? Function( Book pickedBook)?  $suggestionPicked,TResult? Function( Book book,  BookState bookState,  List<Tag> selectedTags)?  $saveBook,TResult? Function()?  $deleteBooksFinished,TResult? Function()?  $deletePickedBooks,TResult? Function()?  $clearDeletionList,TResult? Function( Book book)?  $deleteModeToggled,TResult? Function( String query)?  $booksFiltered,TResult? Function( Book book,  Tag tag)?  $tagToggled,TResult? Function( Book book,  Swiped dir)?  $bookSwiped,TResult? Function()?  $summaryModeClosing,TResult? Function( Book book)?  $summaryModeToggled,TResult? Function()?  $summaryModeClosed,TResult? Function()?  $themeToggled,TResult? Function()?  $systemThemeToggled,TResult? Function( BookSizeLimits limits)?  $sizeLimitsChanged,TResult? Function( ReadingGoal goal)?  $readingGoalChanged,TResult? Function( Book updatedBook)?  $bookFinished,TResult? Function()?  $bookStarted,TResult? Function( Book book)?  $bookUnfinished,TResult? Function()?  $bookUnstarted,TResult? Function( String url)?  $bookSharedFromOutside,TResult? Function()?  $clearSharedBook,}) {final _that = this;
switch (_that) {
case $TabChanged() when $tabChanged != null:
return $tabChanged(_that.selectedTab);case $ImportTriggered() when $importTriggered != null:
return $importTriggered(_that.path);case $ImportFinished() when $importFinished != null:
return $importFinished();case $ExportTriggered() when $exportTriggered != null:
return $exportTriggered(_that.path);case $Searching() when $searching != null:
return $searching(_that.query);case $ShareOffloaded() when $shareOffloaded != null:
return $shareOffloaded(_that.query);case $ResetShareOffload() when $resetShareOffload != null:
return $resetShareOffload();case $SuggestionPicked() when $suggestionPicked != null:
return $suggestionPicked(_that.pickedBook);case $SaveBook() when $saveBook != null:
return $saveBook(_that.book,_that.bookState,_that.selectedTags);case $DeleteBooksFinished() when $deleteBooksFinished != null:
return $deleteBooksFinished();case $DeletePickedBooks() when $deletePickedBooks != null:
return $deletePickedBooks();case $ClearDeletionList() when $clearDeletionList != null:
return $clearDeletionList();case $DeleteModeToggled() when $deleteModeToggled != null:
return $deleteModeToggled(_that.book);case $BooksFiltered() when $booksFiltered != null:
return $booksFiltered(_that.query);case $TagToggled() when $tagToggled != null:
return $tagToggled(_that.book,_that.tag);case $BookSwiped() when $bookSwiped != null:
return $bookSwiped(_that.book,_that.dir);case $SummaryModeClosing() when $summaryModeClosing != null:
return $summaryModeClosing();case $SummaryModeToggled() when $summaryModeToggled != null:
return $summaryModeToggled(_that.book);case $SummaryModeClosed() when $summaryModeClosed != null:
return $summaryModeClosed();case $ThemeToggled() when $themeToggled != null:
return $themeToggled();case $SystemThemeToggled() when $systemThemeToggled != null:
return $systemThemeToggled();case $SizeLimitsChanged() when $sizeLimitsChanged != null:
return $sizeLimitsChanged(_that.limits);case $ReadingGoalChanged() when $readingGoalChanged != null:
return $readingGoalChanged(_that.goal);case $BookFinished() when $bookFinished != null:
return $bookFinished(_that.updatedBook);case $BookStarted() when $bookStarted != null:
return $bookStarted();case $BookUnfinished() when $bookUnfinished != null:
return $bookUnfinished(_that.book);case $BookUnstarted() when $bookUnstarted != null:
return $bookUnstarted();case $BookSharedFromOutside() when $bookSharedFromOutside != null:
return $bookSharedFromOutside(_that.url);case $ClearSharedBook() when $clearSharedBook != null:
return $clearSharedBook();case _:
  return null;

}
}

}

/// @nodoc


class $TabChanged implements BusEvent {
  const $TabChanged({required this.selectedTab});
  

 final  AppTab selectedTab;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$TabChangedCopyWith<$TabChanged> get copyWith => _$$TabChangedCopyWithImpl<$TabChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $TabChanged&&(identical(other.selectedTab, selectedTab) || other.selectedTab == selectedTab));
}


@override
int get hashCode => Object.hash(runtimeType,selectedTab);

@override
String toString() {
  return 'BusEvent.\$tabChanged(selectedTab: $selectedTab)';
}


}

/// @nodoc
abstract mixin class $$TabChangedCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$TabChangedCopyWith($TabChanged value, $Res Function($TabChanged) _then) = _$$TabChangedCopyWithImpl;
@useResult
$Res call({
 AppTab selectedTab
});




}
/// @nodoc
class _$$TabChangedCopyWithImpl<$Res>
    implements $$TabChangedCopyWith<$Res> {
  _$$TabChangedCopyWithImpl(this._self, this._then);

  final $TabChanged _self;
  final $Res Function($TabChanged) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? selectedTab = null,}) {
  return _then($TabChanged(
selectedTab: null == selectedTab ? _self.selectedTab : selectedTab // ignore: cast_nullable_to_non_nullable
as AppTab,
  ));
}


}

/// @nodoc


class $ImportTriggered implements BusEvent {
  const $ImportTriggered({required this.path});
  

 final  String path;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$ImportTriggeredCopyWith<$ImportTriggered> get copyWith => _$$ImportTriggeredCopyWithImpl<$ImportTriggered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $ImportTriggered&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'BusEvent.\$importTriggered(path: $path)';
}


}

/// @nodoc
abstract mixin class $$ImportTriggeredCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$ImportTriggeredCopyWith($ImportTriggered value, $Res Function($ImportTriggered) _then) = _$$ImportTriggeredCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class _$$ImportTriggeredCopyWithImpl<$Res>
    implements $$ImportTriggeredCopyWith<$Res> {
  _$$ImportTriggeredCopyWithImpl(this._self, this._then);

  final $ImportTriggered _self;
  final $Res Function($ImportTriggered) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then($ImportTriggered(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class $ImportFinished implements BusEvent {
  const $ImportFinished();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $ImportFinished);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BusEvent.\$importFinished()';
}


}




/// @nodoc


class $ExportTriggered implements BusEvent {
  const $ExportTriggered({required this.path});
  

 final  String path;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$ExportTriggeredCopyWith<$ExportTriggered> get copyWith => _$$ExportTriggeredCopyWithImpl<$ExportTriggered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $ExportTriggered&&(identical(other.path, path) || other.path == path));
}


@override
int get hashCode => Object.hash(runtimeType,path);

@override
String toString() {
  return 'BusEvent.\$exportTriggered(path: $path)';
}


}

/// @nodoc
abstract mixin class $$ExportTriggeredCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$ExportTriggeredCopyWith($ExportTriggered value, $Res Function($ExportTriggered) _then) = _$$ExportTriggeredCopyWithImpl;
@useResult
$Res call({
 String path
});




}
/// @nodoc
class _$$ExportTriggeredCopyWithImpl<$Res>
    implements $$ExportTriggeredCopyWith<$Res> {
  _$$ExportTriggeredCopyWithImpl(this._self, this._then);

  final $ExportTriggered _self;
  final $Res Function($ExportTriggered) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? path = null,}) {
  return _then($ExportTriggered(
path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class $Searching implements BusEvent {
  const $Searching({required this.query});
  

 final  String query;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$SearchingCopyWith<$Searching> get copyWith => _$$SearchingCopyWithImpl<$Searching>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $Searching&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'BusEvent.\$searching(query: $query)';
}


}

/// @nodoc
abstract mixin class $$SearchingCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$SearchingCopyWith($Searching value, $Res Function($Searching) _then) = _$$SearchingCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$$SearchingCopyWithImpl<$Res>
    implements $$SearchingCopyWith<$Res> {
  _$$SearchingCopyWithImpl(this._self, this._then);

  final $Searching _self;
  final $Res Function($Searching) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then($Searching(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class $ShareOffloaded implements BusEvent {
  const $ShareOffloaded({required this.query});
  

 final  String query;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$ShareOffloadedCopyWith<$ShareOffloaded> get copyWith => _$$ShareOffloadedCopyWithImpl<$ShareOffloaded>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $ShareOffloaded&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'BusEvent.\$shareOffloaded(query: $query)';
}


}

/// @nodoc
abstract mixin class $$ShareOffloadedCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$ShareOffloadedCopyWith($ShareOffloaded value, $Res Function($ShareOffloaded) _then) = _$$ShareOffloadedCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$$ShareOffloadedCopyWithImpl<$Res>
    implements $$ShareOffloadedCopyWith<$Res> {
  _$$ShareOffloadedCopyWithImpl(this._self, this._then);

  final $ShareOffloaded _self;
  final $Res Function($ShareOffloaded) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then($ShareOffloaded(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class $ResetShareOffload implements BusEvent {
  const $ResetShareOffload();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $ResetShareOffload);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BusEvent.\$resetShareOffload()';
}


}




/// @nodoc


class $SuggestionPicked implements BusEvent {
  const $SuggestionPicked({required this.pickedBook});
  

 final  Book pickedBook;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$SuggestionPickedCopyWith<$SuggestionPicked> get copyWith => _$$SuggestionPickedCopyWithImpl<$SuggestionPicked>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $SuggestionPicked&&(identical(other.pickedBook, pickedBook) || other.pickedBook == pickedBook));
}


@override
int get hashCode => Object.hash(runtimeType,pickedBook);

@override
String toString() {
  return 'BusEvent.\$suggestionPicked(pickedBook: $pickedBook)';
}


}

/// @nodoc
abstract mixin class $$SuggestionPickedCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$SuggestionPickedCopyWith($SuggestionPicked value, $Res Function($SuggestionPicked) _then) = _$$SuggestionPickedCopyWithImpl;
@useResult
$Res call({
 Book pickedBook
});


$BookCopyWith<$Res> get pickedBook;

}
/// @nodoc
class _$$SuggestionPickedCopyWithImpl<$Res>
    implements $$SuggestionPickedCopyWith<$Res> {
  _$$SuggestionPickedCopyWithImpl(this._self, this._then);

  final $SuggestionPicked _self;
  final $Res Function($SuggestionPicked) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? pickedBook = null,}) {
  return _then($SuggestionPicked(
pickedBook: null == pickedBook ? _self.pickedBook : pickedBook // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get pickedBook {
  
  return $BookCopyWith<$Res>(_self.pickedBook, (value) {
    return _then(_self.copyWith(pickedBook: value));
  });
}
}

/// @nodoc


class $SaveBook implements BusEvent {
  const $SaveBook({required this.book, required this.bookState, required final  List<Tag> selectedTags}): _selectedTags = selectedTags;
  

 final  Book book;
 final  BookState bookState;
 final  List<Tag> _selectedTags;
 List<Tag> get selectedTags {
  if (_selectedTags is EqualUnmodifiableListView) return _selectedTags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_selectedTags);
}


/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$SaveBookCopyWith<$SaveBook> get copyWith => _$$SaveBookCopyWithImpl<$SaveBook>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $SaveBook&&(identical(other.book, book) || other.book == book)&&(identical(other.bookState, bookState) || other.bookState == bookState)&&const DeepCollectionEquality().equals(other._selectedTags, _selectedTags));
}


@override
int get hashCode => Object.hash(runtimeType,book,bookState,const DeepCollectionEquality().hash(_selectedTags));

@override
String toString() {
  return 'BusEvent.\$saveBook(book: $book, bookState: $bookState, selectedTags: $selectedTags)';
}


}

/// @nodoc
abstract mixin class $$SaveBookCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$SaveBookCopyWith($SaveBook value, $Res Function($SaveBook) _then) = _$$SaveBookCopyWithImpl;
@useResult
$Res call({
 Book book, BookState bookState, List<Tag> selectedTags
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$$SaveBookCopyWithImpl<$Res>
    implements $$SaveBookCopyWith<$Res> {
  _$$SaveBookCopyWithImpl(this._self, this._then);

  final $SaveBook _self;
  final $Res Function($SaveBook) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,Object? bookState = null,Object? selectedTags = null,}) {
  return _then($SaveBook(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,bookState: null == bookState ? _self.bookState : bookState // ignore: cast_nullable_to_non_nullable
as BookState,selectedTags: null == selectedTags ? _self._selectedTags : selectedTags // ignore: cast_nullable_to_non_nullable
as List<Tag>,
  ));
}

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

/// @nodoc


class $DeleteBooksFinished implements BusEvent {
  const $DeleteBooksFinished();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $DeleteBooksFinished);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BusEvent.\$deleteBooksFinished()';
}


}




/// @nodoc


class $DeletePickedBooks implements BusEvent {
  const $DeletePickedBooks();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $DeletePickedBooks);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BusEvent.\$deletePickedBooks()';
}


}




/// @nodoc


class $ClearDeletionList implements BusEvent {
  const $ClearDeletionList();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $ClearDeletionList);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BusEvent.\$clearDeletionList()';
}


}




/// @nodoc


class $DeleteModeToggled implements BusEvent {
  const $DeleteModeToggled({required this.book});
  

 final  Book book;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$DeleteModeToggledCopyWith<$DeleteModeToggled> get copyWith => _$$DeleteModeToggledCopyWithImpl<$DeleteModeToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $DeleteModeToggled&&(identical(other.book, book) || other.book == book));
}


@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'BusEvent.\$deleteModeToggled(book: $book)';
}


}

/// @nodoc
abstract mixin class $$DeleteModeToggledCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$DeleteModeToggledCopyWith($DeleteModeToggled value, $Res Function($DeleteModeToggled) _then) = _$$DeleteModeToggledCopyWithImpl;
@useResult
$Res call({
 Book book
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$$DeleteModeToggledCopyWithImpl<$Res>
    implements $$DeleteModeToggledCopyWith<$Res> {
  _$$DeleteModeToggledCopyWithImpl(this._self, this._then);

  final $DeleteModeToggled _self;
  final $Res Function($DeleteModeToggled) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then($DeleteModeToggled(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

/// @nodoc


class $BooksFiltered implements BusEvent {
  const $BooksFiltered({required this.query});
  

 final  String query;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$BooksFilteredCopyWith<$BooksFiltered> get copyWith => _$$BooksFilteredCopyWithImpl<$BooksFiltered>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $BooksFiltered&&(identical(other.query, query) || other.query == query));
}


@override
int get hashCode => Object.hash(runtimeType,query);

@override
String toString() {
  return 'BusEvent.\$booksFiltered(query: $query)';
}


}

/// @nodoc
abstract mixin class $$BooksFilteredCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$BooksFilteredCopyWith($BooksFiltered value, $Res Function($BooksFiltered) _then) = _$$BooksFilteredCopyWithImpl;
@useResult
$Res call({
 String query
});




}
/// @nodoc
class _$$BooksFilteredCopyWithImpl<$Res>
    implements $$BooksFilteredCopyWith<$Res> {
  _$$BooksFilteredCopyWithImpl(this._self, this._then);

  final $BooksFiltered _self;
  final $Res Function($BooksFiltered) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? query = null,}) {
  return _then($BooksFiltered(
query: null == query ? _self.query : query // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class $TagToggled implements BusEvent {
  const $TagToggled({required this.book, required this.tag});
  

 final  Book book;
 final  Tag tag;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$TagToggledCopyWith<$TagToggled> get copyWith => _$$TagToggledCopyWithImpl<$TagToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $TagToggled&&(identical(other.book, book) || other.book == book)&&(identical(other.tag, tag) || other.tag == tag));
}


@override
int get hashCode => Object.hash(runtimeType,book,tag);

@override
String toString() {
  return 'BusEvent.\$tagToggled(book: $book, tag: $tag)';
}


}

/// @nodoc
abstract mixin class $$TagToggledCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$TagToggledCopyWith($TagToggled value, $Res Function($TagToggled) _then) = _$$TagToggledCopyWithImpl;
@useResult
$Res call({
 Book book, Tag tag
});


$BookCopyWith<$Res> get book;$TagCopyWith<$Res> get tag;

}
/// @nodoc
class _$$TagToggledCopyWithImpl<$Res>
    implements $$TagToggledCopyWith<$Res> {
  _$$TagToggledCopyWithImpl(this._self, this._then);

  final $TagToggled _self;
  final $Res Function($TagToggled) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,Object? tag = null,}) {
  return _then($TagToggled(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,tag: null == tag ? _self.tag : tag // ignore: cast_nullable_to_non_nullable
as Tag,
  ));
}

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$TagCopyWith<$Res> get tag {
  
  return $TagCopyWith<$Res>(_self.tag, (value) {
    return _then(_self.copyWith(tag: value));
  });
}
}

/// @nodoc


class $BookSwiped implements BusEvent {
  const $BookSwiped({required this.book, required this.dir});
  

 final  Book book;
 final  Swiped dir;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$BookSwipedCopyWith<$BookSwiped> get copyWith => _$$BookSwipedCopyWithImpl<$BookSwiped>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $BookSwiped&&(identical(other.book, book) || other.book == book)&&(identical(other.dir, dir) || other.dir == dir));
}


@override
int get hashCode => Object.hash(runtimeType,book,dir);

@override
String toString() {
  return 'BusEvent.\$bookSwiped(book: $book, dir: $dir)';
}


}

/// @nodoc
abstract mixin class $$BookSwipedCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$BookSwipedCopyWith($BookSwiped value, $Res Function($BookSwiped) _then) = _$$BookSwipedCopyWithImpl;
@useResult
$Res call({
 Book book, Swiped dir
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$$BookSwipedCopyWithImpl<$Res>
    implements $$BookSwipedCopyWith<$Res> {
  _$$BookSwipedCopyWithImpl(this._self, this._then);

  final $BookSwiped _self;
  final $Res Function($BookSwiped) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,Object? dir = null,}) {
  return _then($BookSwiped(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,dir: null == dir ? _self.dir : dir // ignore: cast_nullable_to_non_nullable
as Swiped,
  ));
}

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

/// @nodoc


class $SummaryModeClosing implements BusEvent {
  const $SummaryModeClosing();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $SummaryModeClosing);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BusEvent.\$summaryModeClosing()';
}


}




/// @nodoc


class $SummaryModeToggled implements BusEvent {
  const $SummaryModeToggled({required this.book});
  

 final  Book book;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$SummaryModeToggledCopyWith<$SummaryModeToggled> get copyWith => _$$SummaryModeToggledCopyWithImpl<$SummaryModeToggled>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $SummaryModeToggled&&(identical(other.book, book) || other.book == book));
}


@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'BusEvent.\$summaryModeToggled(book: $book)';
}


}

/// @nodoc
abstract mixin class $$SummaryModeToggledCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$SummaryModeToggledCopyWith($SummaryModeToggled value, $Res Function($SummaryModeToggled) _then) = _$$SummaryModeToggledCopyWithImpl;
@useResult
$Res call({
 Book book
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$$SummaryModeToggledCopyWithImpl<$Res>
    implements $$SummaryModeToggledCopyWith<$Res> {
  _$$SummaryModeToggledCopyWithImpl(this._self, this._then);

  final $SummaryModeToggled _self;
  final $Res Function($SummaryModeToggled) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then($SummaryModeToggled(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

/// @nodoc


class $SummaryModeClosed implements BusEvent {
  const $SummaryModeClosed();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $SummaryModeClosed);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BusEvent.\$summaryModeClosed()';
}


}




/// @nodoc


class $ThemeToggled implements BusEvent {
  const $ThemeToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $ThemeToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BusEvent.\$themeToggled()';
}


}




/// @nodoc


class $SystemThemeToggled implements BusEvent {
  const $SystemThemeToggled();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $SystemThemeToggled);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BusEvent.\$systemThemeToggled()';
}


}




/// @nodoc


class $SizeLimitsChanged implements BusEvent {
  const $SizeLimitsChanged({required this.limits});
  

 final  BookSizeLimits limits;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$SizeLimitsChangedCopyWith<$SizeLimitsChanged> get copyWith => _$$SizeLimitsChangedCopyWithImpl<$SizeLimitsChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $SizeLimitsChanged&&(identical(other.limits, limits) || other.limits == limits));
}


@override
int get hashCode => Object.hash(runtimeType,limits);

@override
String toString() {
  return 'BusEvent.\$sizeLimitsChanged(limits: $limits)';
}


}

/// @nodoc
abstract mixin class $$SizeLimitsChangedCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$SizeLimitsChangedCopyWith($SizeLimitsChanged value, $Res Function($SizeLimitsChanged) _then) = _$$SizeLimitsChangedCopyWithImpl;
@useResult
$Res call({
 BookSizeLimits limits
});




}
/// @nodoc
class _$$SizeLimitsChangedCopyWithImpl<$Res>
    implements $$SizeLimitsChangedCopyWith<$Res> {
  _$$SizeLimitsChangedCopyWithImpl(this._self, this._then);

  final $SizeLimitsChanged _self;
  final $Res Function($SizeLimitsChanged) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? limits = null,}) {
  return _then($SizeLimitsChanged(
limits: null == limits ? _self.limits : limits // ignore: cast_nullable_to_non_nullable
as BookSizeLimits,
  ));
}


}

/// @nodoc


class $ReadingGoalChanged implements BusEvent {
  const $ReadingGoalChanged({required this.goal});
  

 final  ReadingGoal goal;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$ReadingGoalChangedCopyWith<$ReadingGoalChanged> get copyWith => _$$ReadingGoalChangedCopyWithImpl<$ReadingGoalChanged>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $ReadingGoalChanged&&(identical(other.goal, goal) || other.goal == goal));
}


@override
int get hashCode => Object.hash(runtimeType,goal);

@override
String toString() {
  return 'BusEvent.\$readingGoalChanged(goal: $goal)';
}


}

/// @nodoc
abstract mixin class $$ReadingGoalChangedCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$ReadingGoalChangedCopyWith($ReadingGoalChanged value, $Res Function($ReadingGoalChanged) _then) = _$$ReadingGoalChangedCopyWithImpl;
@useResult
$Res call({
 ReadingGoal goal
});




}
/// @nodoc
class _$$ReadingGoalChangedCopyWithImpl<$Res>
    implements $$ReadingGoalChangedCopyWith<$Res> {
  _$$ReadingGoalChangedCopyWithImpl(this._self, this._then);

  final $ReadingGoalChanged _self;
  final $Res Function($ReadingGoalChanged) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? goal = null,}) {
  return _then($ReadingGoalChanged(
goal: null == goal ? _self.goal : goal // ignore: cast_nullable_to_non_nullable
as ReadingGoal,
  ));
}


}

/// @nodoc


class $BookFinished implements BusEvent {
  const $BookFinished({required this.updatedBook});
  

 final  Book updatedBook;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$BookFinishedCopyWith<$BookFinished> get copyWith => _$$BookFinishedCopyWithImpl<$BookFinished>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $BookFinished&&(identical(other.updatedBook, updatedBook) || other.updatedBook == updatedBook));
}


@override
int get hashCode => Object.hash(runtimeType,updatedBook);

@override
String toString() {
  return 'BusEvent.\$bookFinished(updatedBook: $updatedBook)';
}


}

/// @nodoc
abstract mixin class $$BookFinishedCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$BookFinishedCopyWith($BookFinished value, $Res Function($BookFinished) _then) = _$$BookFinishedCopyWithImpl;
@useResult
$Res call({
 Book updatedBook
});


$BookCopyWith<$Res> get updatedBook;

}
/// @nodoc
class _$$BookFinishedCopyWithImpl<$Res>
    implements $$BookFinishedCopyWith<$Res> {
  _$$BookFinishedCopyWithImpl(this._self, this._then);

  final $BookFinished _self;
  final $Res Function($BookFinished) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? updatedBook = null,}) {
  return _then($BookFinished(
updatedBook: null == updatedBook ? _self.updatedBook : updatedBook // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get updatedBook {
  
  return $BookCopyWith<$Res>(_self.updatedBook, (value) {
    return _then(_self.copyWith(updatedBook: value));
  });
}
}

/// @nodoc


class $BookStarted implements BusEvent {
  const $BookStarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $BookStarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BusEvent.\$bookStarted()';
}


}




/// @nodoc


class $BookUnfinished implements BusEvent {
  const $BookUnfinished({required this.book});
  

 final  Book book;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$BookUnfinishedCopyWith<$BookUnfinished> get copyWith => _$$BookUnfinishedCopyWithImpl<$BookUnfinished>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $BookUnfinished&&(identical(other.book, book) || other.book == book));
}


@override
int get hashCode => Object.hash(runtimeType,book);

@override
String toString() {
  return 'BusEvent.\$bookUnfinished(book: $book)';
}


}

/// @nodoc
abstract mixin class $$BookUnfinishedCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$BookUnfinishedCopyWith($BookUnfinished value, $Res Function($BookUnfinished) _then) = _$$BookUnfinishedCopyWithImpl;
@useResult
$Res call({
 Book book
});


$BookCopyWith<$Res> get book;

}
/// @nodoc
class _$$BookUnfinishedCopyWithImpl<$Res>
    implements $$BookUnfinishedCopyWith<$Res> {
  _$$BookUnfinishedCopyWithImpl(this._self, this._then);

  final $BookUnfinished _self;
  final $Res Function($BookUnfinished) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? book = null,}) {
  return _then($BookUnfinished(
book: null == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as Book,
  ));
}

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$BookCopyWith<$Res> get book {
  
  return $BookCopyWith<$Res>(_self.book, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

/// @nodoc


class $BookUnstarted implements BusEvent {
  const $BookUnstarted();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $BookUnstarted);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BusEvent.\$bookUnstarted()';
}


}




/// @nodoc


class $BookSharedFromOutside implements BusEvent {
  const $BookSharedFromOutside({required this.url});
  

 final  String url;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$$BookSharedFromOutsideCopyWith<$BookSharedFromOutside> get copyWith => _$$BookSharedFromOutsideCopyWithImpl<$BookSharedFromOutside>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $BookSharedFromOutside&&(identical(other.url, url) || other.url == url));
}


@override
int get hashCode => Object.hash(runtimeType,url);

@override
String toString() {
  return 'BusEvent.\$bookSharedFromOutside(url: $url)';
}


}

/// @nodoc
abstract mixin class $$BookSharedFromOutsideCopyWith<$Res> implements $BusEventCopyWith<$Res> {
  factory $$BookSharedFromOutsideCopyWith($BookSharedFromOutside value, $Res Function($BookSharedFromOutside) _then) = _$$BookSharedFromOutsideCopyWithImpl;
@useResult
$Res call({
 String url
});




}
/// @nodoc
class _$$BookSharedFromOutsideCopyWithImpl<$Res>
    implements $$BookSharedFromOutsideCopyWith<$Res> {
  _$$BookSharedFromOutsideCopyWithImpl(this._self, this._then);

  final $BookSharedFromOutside _self;
  final $Res Function($BookSharedFromOutside) _then;

/// Create a copy of BusEvent
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') $Res call({Object? url = null,}) {
  return _then($BookSharedFromOutside(
url: null == url ? _self.url : url // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

/// @nodoc


class $ClearSharedBook implements BusEvent {
  const $ClearSharedBook();
  






@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is $ClearSharedBook);
}


@override
int get hashCode => runtimeType.hashCode;

@override
String toString() {
  return 'BusEvent.\$clearSharedBook()';
}


}




// dart format on
