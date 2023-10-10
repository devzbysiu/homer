import 'package:dartz/dartz.dart';

import '../../../tags_manager/domain/entities/tag.dart';
import '../../domain/entities/local_book.dart';
import '../models/local_book_dto.dart';
import '../models/local_tag_dto.dart';

final class LocalBookMapper {
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
      );

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
      );

  BookState _toBookState(LocalBookStateDTO state) {
    switch (state) {
      case LocalBookStateDTO.readLater:
        return BookState.readLater;
      case LocalBookStateDTO.reading:
        return BookState.reading;
      case LocalBookStateDTO.read:
        return BookState.read;
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
    }
  }

  LocalBookStateDTO _toBookStateDTO(BookState state) {
    switch (state) {
      case BookState.readLater:
        return LocalBookStateDTO.readLater;
      case BookState.reading:
        return LocalBookStateDTO.reading;
      case BookState.read:
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
    }
  }

  List<LocalBookDTO> toLocalBookDTOs(List<LocalBook> books) {
    return books.map((book) => toLocalBookDTO(book)).toList();
  }
}
