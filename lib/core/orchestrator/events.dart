import 'dart:io';

import 'package:equatable/equatable.dart';

import '../../features/manage_books/presentation/bloc/navigation/app_tab_bloc.dart';
import '../../features/settings/domain/entities/book_size_limits.dart';
import '../../features/settings/domain/entities/reading_goal.dart';
import '../entities/book.dart';
import '../entities/tag.dart';

abstract class BusEvent extends Equatable {
  const BusEvent();

  @override
  List<Object> get props => [];
}

final class RestoreStarted extends BusEvent {
  const RestoreStarted(this.backupPath);

  final String backupPath;

  @override
  List<Object> get props => [backupPath];
}

final class RestoreFinished extends BusEvent {}

final class BackupStarted extends BusEvent {
  const BackupStarted(this.backupPath);

  final String backupPath;

  @override
  List<Object> get props => [backupPath];
}

final class BackupFinished extends BusEvent {}

final class SearchStarted extends BusEvent {
  const SearchStarted(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}

final class SaveBookStarted extends BusEvent {
  const SaveBookStarted(this.book, this.bookState, this.selectedTags);

  final Book book;

  final BookState bookState;

  final List<Tag> selectedTags;

  @override
  List<Object> get props => [book, bookState, selectedTags];
}

final class SuggestionPicked extends BusEvent {
  const SuggestionPicked(this.book);

  final Book book;

  @override
  List<Object> get props => [book];
}

final class DeleteModeToggled extends BusEvent {
  const DeleteModeToggled(this.book);

  final Book book;

  @override
  List<Object> get props => [book];
}

final class DeleteModeExited extends BusEvent {}

final class DeleteBooksStarted extends BusEvent {}

final class FilteringStarted extends BusEvent {
  const FilteringStarted(this.query);

  final String query;

  @override
  List<Object> get props => [query];
}

final class DeleteBooksFinished extends BusEvent {}

final class SwipedToRight extends BusEvent {
  const SwipedToRight(this.book);

  final Book book;

  @override
  List<Object> get props => [book];
}

final class SwipedToLeft extends BusEvent {
  const SwipedToLeft(this.book);

  final Book book;

  @override
  List<Object> get props => [book];
}

final class TagAdded extends BusEvent {
  const TagAdded(this.book, this.tag);

  final Book book;

  final Tag tag;

  @override
  List<Object> get props => [book, tag];
}

final class TabTapped extends BusEvent {
  const TabTapped(this.tab);

  final AppTab tab;

  @override
  List<Object> get props => [tab];
}

final class SummaryModeClosing extends BusEvent {}

final class SummaryModeEntered extends BusEvent {
  const SummaryModeEntered(this.book);

  final Book book;

  @override
  List<Object> get props => [book];
}

final class SummaryModeClosed extends BusEvent {}

final class SystemThemeEnabled extends BusEvent {}

final class BackupDirPicked extends BusEvent {
  const BackupDirPicked(this.dir);

  final Directory dir;

  @override
  List<Object> get props => [dir];
}

final class SizeLimitsChanged extends BusEvent {
  const SizeLimitsChanged(this.limits);

  final BookSizeLimits limits;

  @override
  List<Object> get props => [limits];
}

final class GoalChanged extends BusEvent {
  const GoalChanged(this.goal);

  final ReadingGoal goal;

  @override
  List<Object> get props => [goal];
}

final class ThemeChanged extends BusEvent {}

final class BookRead extends BusEvent {
  const BookRead(this.book);

  final Book book;

  @override
  List<Object> get props => [book];
}

final class BookReading extends BusEvent {}

final class BookUnread extends BusEvent {
  const BookUnread(this.book);

  final Book book;

  @override
  List<Object> get props => [book];
}

final class BookUnreading extends BusEvent {}
