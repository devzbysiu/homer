import 'package:dartz/dartz.dart';

import '../../features/books_listing/data/models/local_book_dto.dart';
import '../../features/books_listing/data/models/local_tag_dto.dart';
import '../../features/books_listing/domain/entities/local_book.dart';
import '../../features/tags_manager/domain/entities/tag.dart';

List<LocalBook> toLocalBooks(List<LocalBookDTO> bookModels) {
  return bookModels.map(_toLocalBook).toList();
}

LocalBook _toLocalBook(LocalBookDTO bookDTO) => LocalBook(
      title: bookDTO.title,
      subtitle: bookDTO.subtitle,
      authors: bookDTO.authors,
      state: _toBookState(bookDTO.state),
      pageCount: bookDTO.pageCount,
      isbn: bookDTO.isbn,
      thumbnailAddress: optionOf(bookDTO.thumbnailAddress),
      rating: bookDTO.rating,
      summary: bookDTO.summary,
      tags: _toBookTags(bookDTO.tags),
      dateModified: _toDateTime(bookDTO.dateModified),
    );

DateTime _toDateTime(int dateModified) {
  return DateTime.fromMicrosecondsSinceEpoch(dateModified);
}

LocalBookDTO toLocalBookDTO(LocalBook book) => LocalBookDTO(
      title: book.title,
      subtitle: book.subtitle,
      authors: book.authors,
      state: _toBookStateDTO(book.state),
      pageCount: book.pageCount,
      isbn: book.isbn,
      thumbnailAddress: book.thumbnailAddress.toNullable(),
      rating: book.rating,
      summary: book.summary,
      tags: _toTagDTOs(book.tags),
      dateModified: book.dateModified.microsecondsSinceEpoch,
    );

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
  return tags
      .map((tagModel) => Tag(
            name: tagModel.name,
            color: _toTagColor(tagModel.color),
          ))
      .toSet();
}

TagColor _toTagColor(LocalTagColorDTO color) {
  switch (color) {
    case LocalTagColorDTO.brown:
      return TagColor.brown;
    case LocalTagColorDTO.black:
      return TagColor.black;
    case LocalTagColorDTO.green:
      return TagColor.green;
    case LocalTagColorDTO.blue:
      return TagColor.blue;
    case LocalTagColorDTO.orange:
      return TagColor.orange;
    case LocalTagColorDTO.red:
      return TagColor.red;
    case LocalTagColorDTO.yellow:
      return TagColor.yellow;
    case LocalTagColorDTO.grey:
      return TagColor.grey;
    case LocalTagColorDTO.purple:
      return TagColor.purple;
  }
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
  return tags
      .map((tag) => LocalTagDTO()
        ..name = tag.name
        ..color = _toTagColorDTO(tag.color))
      .toList();
}

LocalTagColorDTO _toTagColorDTO(TagColor color) {
  switch (color) {
    case TagColor.brown:
      return LocalTagColorDTO.brown;
    case TagColor.black:
      return LocalTagColorDTO.black;
    case TagColor.green:
      return LocalTagColorDTO.green;
    case TagColor.blue:
      return LocalTagColorDTO.blue;
    case TagColor.orange:
      return LocalTagColorDTO.orange;
    case TagColor.red:
      return LocalTagColorDTO.red;
    case TagColor.yellow:
      return LocalTagColorDTO.yellow;
    case TagColor.grey:
      return LocalTagColorDTO.grey;
    case TagColor.purple:
      return LocalTagColorDTO.purple;
  }
}

List<LocalBookDTO> toLocalBookDTOs(List<LocalBook> books) {
  return books.map((book) => toLocalBookDTO(book)).toList();
}
