import 'package:dartz/dartz.dart';

import '../../features/backup_and_restore/data/models/local_backup_book_dto.dart';
import '../../features/manage_books/data/models/local_book_dto.dart';
import '../../features/manage_books/data/models/local_tag_dto.dart';
import '../../features/manage_books/domain/entities/local_book.dart';
import '../../features/tags_manager/domain/entities/tag.dart';
import '../utils/date_option_ext.dart';

// ================ [ LocalBookDTO to LocalBook ] =====================

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

List<Tag> _toBookTags(List<LocalTagDTO> tags) {
  return tags.map((tagModel) {
    return Tag(
      name: tagModel.name,
      hexColor: tagModel.hexColor,
    );
  }).toList();
}

Option<DateTime> _toDateTime(int? millisSinceEpoch) {
  return millisSinceEpoch == null || millisSinceEpoch == 0
      ? none()
      : some(DateTime.fromMillisecondsSinceEpoch(millisSinceEpoch));
}

// ================ [ LocalBook to LocalBookDTO ] =====================

List<LocalBookDTO> toLocalBookDTOs(List<LocalBook> books) {
  return books.map((book) => toLocalBookDTO(book)).toList();
}

LocalBookDTO toLocalBookDTO(LocalBook book) {
  final bookDTO = LocalBookDTO(
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
    startDate: book.startDate.millisSinceEpoch(),
    endDate: book.endDate.millisSinceEpoch(),
  );
  return book.id != null ? (bookDTO..id = book.id!) : bookDTO;
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

List<LocalTagDTO> _toTagDTOs(List<Tag> tags) {
  return tags.map((tag) {
    return LocalTagDTO()
      ..name = tag.name
      ..hexColor = tag.hexColor;
  }).toList();
}

// ================ [ LocalBook to LocalBackupBookDTO ] =====================

// TODO: Cover this with tests
List<LocalBackupBookDTO> toLocalBackupBookDTOs(List<LocalBook> books) {
  return books.map(_toLocalBackupBookDTO).toList();
}

LocalBackupBookDTO _toLocalBackupBookDTO(LocalBook book) {
  return LocalBackupBookDTO(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    state: _toLocalBackupBookStateDTO(book.state),
    pageCount: book.pageCount,
    isbn: book.isbn,
    thumbnailAddress: book.thumbnailAddress,
    rating: book.rating,
    summary: book.summary,
    tags: _toLocalBackupTagDTOs(book.tags),
    startDate: book.startDate,
    endDate: book.endDate,
  );
}

LocalBackupBookStateDTO _toLocalBackupBookStateDTO(LocalBookState state) {
  switch (state) {
    case LocalBookState.readLater:
      return LocalBackupBookStateDTO.readLater;
    case LocalBookState.reading:
      return LocalBackupBookStateDTO.reading;
    case LocalBookState.read:
      return LocalBackupBookStateDTO.read;
  }
}

Set<LocalBackupTagDTO> _toLocalBackupTagDTOs(List<Tag> tags) {
  return tags.map((tag) {
    return LocalBackupTagDTO(
      name: tag.name,
      hexColor: tag.hexColor,
    );
  }).toSet();
}
