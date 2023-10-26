import '../../features/backup_and_restore/domain/entities/restored_book.dart';
import '../../features/book_summary/domain/entities/local_book.dart';
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
      summary: restoredBook.summary,
      tags: _toLocalBookTags(restoredBook.tags),
      startDate: restoredBook.startDate,
      endDate: restoredBook.endDate,
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
    hexColor: restoredTag.hexColor,
  );
}
