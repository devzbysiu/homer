import 'package:dartz/dartz.dart';

import '../../features/book_summary/domain/entities/local_book.dart';
import '../../features/books_listing/data/models/local_book_dto.dart';
import '../../features/books_listing/data/models/local_tag_dto.dart';
import '../../features/tags_manager/domain/entities/tag.dart';
import '../utils/extensions/date_option_ext.dart';

List<LocalBook> toLocalBooks(List<LocalBookDTO> bookModels) {
  return bookModels.map(_toLocalBook).toList();
}

LocalBook _toLocalBook(LocalBookDTO bookDTO) => LocalBook(
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
      tags: _toBookTags(bookDTO.tags),
      startDate: _toDateTime(bookDTO.startDate),
      endDate: _toDateTime(bookDTO.endDate),
    );

Option<DateTime> _toDateTime(int? millisSinceEpoch) {
  return millisSinceEpoch == null || millisSinceEpoch == 0
      ? none()
      : some(DateTime.fromMillisecondsSinceEpoch(millisSinceEpoch));
}

LocalBookDTO toLocalBookDTO(LocalBook book) {
  // TODO: Clean up this
  return book.id != null
      ? LocalBookDTO(
          id: book.id!,
          title: book.title,
          subtitle: book.subtitle,
          authors: book.authors,
          state: _toBookStateDTO(book.state),
          pageCount: book.pageCount,
          isbn: book.isbn,
          thumbnailAddress: book.thumbnailAddress.toNullable(),
          rating: book.rating,
          summary: book.summary.toNullable(),
          tags: _toTagDTOs(book.tags),
          startDate: book.startDate.nullableMillisSinceEpoch(),
          endDate: book.endDate.nullableMillisSinceEpoch(),
        )
      : LocalBookDTO(
          title: book.title,
          subtitle: book.subtitle,
          authors: book.authors,
          state: _toBookStateDTO(book.state),
          pageCount: book.pageCount,
          isbn: book.isbn,
          thumbnailAddress: book.thumbnailAddress.toNullable(),
          rating: book.rating,
          summary: book.summary.toNullable(),
          tags: _toTagDTOs(book.tags),
          startDate: book.startDate.nullableMillisSinceEpoch(),
          endDate: book.endDate.nullableMillisSinceEpoch(),
        );
}

LocalBookState _toBookState(LocalBookStateDTO state) {
  switch (state) {
    case LocalBookStateDTO.readLater:
      return LocalBookState.readLater;
    case LocalBookStateDTO.reading:
      return LocalBookState.reading;
    case LocalBookStateDTO.read:
      return LocalBookState.read;
  }
}

Set<Tag> _toBookTags(List<LocalTagDTO> tags) {
  return tags.map((tagModel) {
    return Tag(
      name: tagModel.name,
      hexColor: tagModel.hexColor,
    );
  }).toSet();
}

LocalBookStateDTO _toBookStateDTO(LocalBookState state) {
  switch (state) {
    case LocalBookState.readLater:
      return LocalBookStateDTO.readLater;
    case LocalBookState.reading:
      return LocalBookStateDTO.reading;
    case LocalBookState.read:
      return LocalBookStateDTO.read;
  }
}

List<LocalTagDTO> _toTagDTOs(Set<Tag> tags) {
  return tags.map((tag) {
    return LocalTagDTO()
      ..name = tag.name
      ..hexColor = tag.hexColor;
  }).toList();
}

List<LocalBookDTO> toLocalBookDTOs(List<LocalBook> books) {
  return books.map((book) => toLocalBookDTO(book)).toList();
}
