import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/book.dart';

part 'delete_books_event.freezed.dart';

@freezed
class DeleteBooksEvent with _$DeleteBooksEvent {
  const factory DeleteBooksEvent.deletePickedBooks() = DeletePickedBooks;
  const factory DeleteBooksEvent.clearDeletionList() = ClearDeletionList;
  const factory DeleteBooksEvent.deleteModeToggled({required Book book}) =
      DeleteModeToggled;
}
