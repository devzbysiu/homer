import 'package:equatable/equatable.dart';

import '../entities/book.dart';
import '../entities/tag.dart';

abstract class BusEvent extends Equatable {
  const BusEvent();

  @override
  List<Object> get props => [];
}

final class RestoreFinished extends BusEvent {}

final class SaveBookStarted extends BusEvent {
  const SaveBookStarted(this.book, this.bookState, this.selectedTags);

  final Book book;

  final BookState bookState;

  final List<Tag> selectedTags;

  @override
  List<Object> get props => [book, bookState, selectedTags];
}

final class DeleteBooksFinished extends BusEvent {}
