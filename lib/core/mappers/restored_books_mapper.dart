import 'package:dartz/dartz.dart';

import '../../features/backup_and_restore/domain/entities/restored_book.dart';
import '../../features/books_listing/domain/entities/local_book.dart';
import '../../features/tags_manager/domain/entities/tag.dart';

List<LocalBook> toLocalBooks(List<RestoredBook> restoredBooks) {
  return restoredBooks.map(_toLocalBook).toList();
}

LocalBook _toLocalBook(RestoredBook restoredBook) => LocalBook(
      title: restoredBook.title,
      subtitle: restoredBook.subtitle,
      authors: restoredBook.authors,
      state: _toLocalBookState(restoredBook.state),
      pageCount: restoredBook.pageCount,
      isbn: restoredBook.isbn,
      thumbnailAddress: restoredBook.thumbnailAddress,
      rating: restoredBook.rating,
      summary: optionOf(restoredBook.summary),
      tags: _toLocalBookTags(restoredBook.tags),
      dateModified: restoredBook.dateModified,
    );

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
    case RestoredTagColor.yellow:
      return TagColor.yellow;
    case RestoredTagColor.grey:
      return TagColor.grey;
    case RestoredTagColor.purple:
      return TagColor.purple;
  }
}
