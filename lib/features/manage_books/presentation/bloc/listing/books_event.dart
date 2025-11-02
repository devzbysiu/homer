import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/book.dart';
import '../../../../../core/entities/tag.dart';

part 'books_event.freezed.dart';

@freezed
sealed class BooksEvent with _$BooksEvent {
  const factory BooksEvent.saveBook({
    required Book book,
    required BookState bookState,
    required List<Tag> selectedTags,
  }) = SaveBook;

  const factory BooksEvent.bookSwiped({
    required Book book,
    required Swiped dir,
  }) = BookSwiped;

  const factory BooksEvent.refreshBooksList() = RefreshBooksList;

  const factory BooksEvent.tagToggled({required Book book, required Tag tag}) =
      TagToggled;

  const factory BooksEvent.booksFiltered({required String query}) =
      BooksFiltered;

  const factory BooksEvent.bookSaved() = BookSaved;
}
