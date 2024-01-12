import 'package:dartz/dartz.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/entities/tag.dart';
import '../models/book_dto.dart';
import '../models/tag_dto.dart';

List<Book> toBooks(List<BookDTO> bookModels) {
  return bookModels.map(_toBook).toList();
}

Book _toBook(BookDTO bookDTO) {
  return Book(
    id: bookDTO.id,
    title: bookDTO.title,
    subtitle: bookDTO.subtitle,
    authors: bookDTO.authors,
    state: _toBookState(bookDTO.state),
    pageCount: bookDTO.pageCount,
    isbn: bookDTO.isbn,
    thumbnailAddress: optionOf(bookDTO.thumbnailAddress),
    rating: bookDTO.rating,
    summary: optionOf(bookDTO.summary),
    tags: _toTags(bookDTO.tags),
    startDate: _toDateTime(bookDTO.startDate),
    endDate: _toDateTime(bookDTO.endDate),
    alreadySaved: true,
  );
}

BookState _toBookState(BookStateDTO state) {
  switch (state) {
    case BookStateDTO.readLater:
      return BookState.readLater;
    case BookStateDTO.reading:
      return BookState.reading;
    case BookStateDTO.read:
      return BookState.read;
  }
}

List<Tag> _toTags(List<TagDTO> tags) => tags.map(_toTag).toList();

Tag _toTag(TagDTO tag) => Tag(name: tag.name, hexColor: tag.hexColor);

Option<DateTime> _toDateTime(int? millisSinceEpoch) {
  return millisSinceEpoch == null || millisSinceEpoch == 0
      ? none()
      : some(DateTime.fromMillisecondsSinceEpoch(millisSinceEpoch));
}

Book toBook(Book book, BookState state, List<Tag> tags) {
  return book.copyWith(state: state, tags: tags, alreadySaved: true);
}
