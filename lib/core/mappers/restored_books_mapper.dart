import 'package:dartz/dartz.dart';

import '../../features/backup_and_restore/data/models/restored_book_dto.dart';
import '../../features/backup_and_restore/domain/entities/restored_book.dart';
import '../../features/books_listing/domain/entities/local_book.dart';
import '../../features/tags_manager/domain/entities/tag.dart';

List<RestoredBook> toRestoredBook(List<RestoredBookDTO> restoredBookDTOs) {
  return restoredBookDTOs.map(_toRestoredBook).toList();
}

RestoredBook _toRestoredBook(RestoredBookDTO restoredBookDTO) => RestoredBook(
      title: restoredBookDTO.title,
      subtitle: restoredBookDTO.subTitle,
      authors: [restoredBookDTO.author],
      state: _toRestoredBookState(restoredBookDTO.state),
      pageCount: restoredBookDTO.pageCount,
      isbn: restoredBookDTO.isbn,
      thumbnailAddress: optionOf(restoredBookDTO.thumbnailAddress),
      rating: restoredBookDTO.rating,
      summary: restoredBookDTO.summary,
      tags: _toRestoredBookTags(restoredBookDTO.labels),
    );

List<LocalBook> toLocalBooks(List<RestoredBook> restoredBooks) {
  return restoredBooks.map(_toLocalBook).toList();
}

LocalBook _toLocalBook(RestoredBook restoredBook) {
  return LocalBook(
    title: restoredBook.title,
    subtitle: restoredBook.subtitle,
    authors: restoredBook.authors,
    state: _toLocalBookState(restoredBook.state),
    pageCount: restoredBook.pageCount,
    isbn: restoredBook.isbn,
    thumbnailAddress: restoredBook.thumbnailAddress,
    rating: restoredBook.rating,
    summary: restoredBook.summary,
    tags: _toLocalBookTags(restoredBook.tags),
  );
}

LocalBookState _toLocalBookState(RestoredBookState state) {
  switch (state) {
    case RestoredBookState.readLater:
      return LocalBookState.readLater;
    case RestoredBookState.reading:
      return LocalBookState.reading;
    case RestoredBookState.read:
      return LocalBookState.read;
  }
}

Set<Tag> _toLocalBookTags(Set<RestoredTag> tags) {
  return tags.map(_toTag).toSet();
}

Tag _toTag(RestoredTag restoredTag) {
  return Tag(
    name: restoredTag.title,
    color: _toTagColor(restoredTag.color),
  );
}

TagColor _toTagColor(RestoredTagColor color) {
  switch (color) {
    case RestoredTagColor.brown:
      return TagColor.brown;
    case RestoredTagColor.black:
      return TagColor.black;
    case RestoredTagColor.green:
      return TagColor.green;
    case RestoredTagColor.blue:
      return TagColor.blue;
    case RestoredTagColor.orange:
      return TagColor.orange;
    case RestoredTagColor.red:
      return TagColor.red;
  }
}

RestoredBookState _toRestoredBookState(RestoredBookStateDTO state) {
  switch (state) {
    case RestoredBookStateDTO.forLater:
      return RestoredBookState.readLater;
    case RestoredBookStateDTO.reading:
      return RestoredBookState.reading;
    case RestoredBookStateDTO.read:
      return RestoredBookState.read;
  }
}

Set<RestoredTag> _toRestoredBookTags(Set<LabelDTO> labels) {
  return labels.map(_toRestoredTag).toSet();
}

RestoredTag _toRestoredTag(LabelDTO label) {
  // TODO: Change color mapping;
  return RestoredTag(title: label.title, color: RestoredTagColor.red);
}
