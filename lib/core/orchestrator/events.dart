import 'package:equatable/equatable.dart';

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
