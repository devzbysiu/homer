import '../../features/backup_and_restore/data/models/local_backup_book_dto.dart';
import '../../features/backup_and_restore/domain/entities/restored_book.dart';
import '../../features/manage_books/domain/entities/local_book.dart';
import '../../features/tags_manager/domain/entities/tag.dart';

// ================ [ LocalBackupBookDTO to RestoredBook ] =====================

// TODO: Cover this with tests
List<RestoredBook> toRestoredBooks(List<LocalBackupBookDTO> books) {
  return books.map(_toRestoredBook).toList();
}

RestoredBook _toRestoredBook(LocalBackupBookDTO book) => RestoredBook(
      title: book.title,
      subtitle: book.subtitle,
      authors: book.authors,
      state: _toRestoredBookState(book.state),
      pageCount: book.pageCount,
      isbn: book.isbn,
      thumbnailAddress: book.thumbnailAddress,
      rating: book.rating,
      summary: book.summary,
      tags: _toRestoredBookTags(book.tags),
      startDate: book.startDate,
      endDate: book.endDate,
    );

RestoredBookState _toRestoredBookState(LocalBackupBookStateDTO state) {
  switch (state) {
    case LocalBackupBookStateDTO.readLater:
      return RestoredBookState.readLater;
    case LocalBackupBookStateDTO.reading:
      return RestoredBookState.reading;
    case LocalBackupBookStateDTO.read:
      return RestoredBookState.read;
  }
}

Set<RestoredTag> _toRestoredBookTags(Set<LocalBackupTagDTO> tags) {
  return tags.map((tag) {
    return RestoredTag(
      title: tag.name,
      hexColor: tag.hexColor,
    );
  }).toSet();
}

// ================ [ RestoredBook to LocalBook ] =====================

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

List<Tag> _toLocalBookTags(Set<RestoredTag> tags) => tags.map(_toTag).toList();

Tag _toTag(RestoredTag restoredTag) {
  return Tag(
    name: restoredTag.title,
    hexColor: restoredTag.hexColor,
  );
}
