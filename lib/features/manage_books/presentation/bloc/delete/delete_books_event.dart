import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/book.dart';
import '../../../../../core/orchestrator/events.dart';

part 'delete_books_event.freezed.dart';

@freezed
class DeleteBooksEvent with _$DeleteBooksEvent implements BusEvent {
  const factory DeleteBooksEvent.deletePickedBooks() = DeletePickedBooks;
  const factory DeleteBooksEvent.clearDeletionList() = ClearDeletionList;
  const factory DeleteBooksEvent.deleteModeToggled(Book book) =
      DeleteModeToggled;
}
