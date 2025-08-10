import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/book.dart';
import '../../../../../core/entities/tag.dart';
import '../../../../../core/orchestrator/events.dart';

part 'books_event.freezed.dart';

@freezed
sealed class BooksEvent with _$BooksEvent implements BusEvent {
  const factory BooksEvent.saveBook({
    required Book book,
    required BookState bookState,
    required List<Tag> selectedTags,
  }) = SaveBook;

  const factory BooksEvent.bookSwipedRight(Book book) = BookSwipedRight;

  const factory BooksEvent.bookSwipedLeft(Book book) = BookSwipedLeft;

  const factory BooksEvent.refreshBooksList() = RefreshBooksList;

  const factory BooksEvent.tagToggled({required Book book, required Tag tag}) =
      TagToggled;

  const factory BooksEvent.booksFiltered(String query) = BooksFiltered;

  const factory BooksEvent.bookSaved() = BookSaved;
}
