import '../../../../core/entities/book.dart';
import '../../../../core/entities/tag.dart';
import '../models/backup_book_dto.dart';

List<BackupBookDTO> toBackupBookDTOs(List<Book> books) {
  return books.map(_toBackupBookDTO).toList();
}

BackupBookDTO _toBackupBookDTO(Book book) {
  return BackupBookDTO(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    state: book.state,
    pageCount: book.pageCount,
    isbn: book.isbn,
    thumbnailAddress: book.thumbnailAddress,
    rating: book.rating,
    summary: book.summary,
    tags: _toBackupTagDTOs(book.tags),
    startDate: book.startDate,
    endDate: book.endDate,
  );
}

List<BackupTagDTO> _toBackupTagDTOs(List<Tag> tags) {
  return tags.map(_toBackupTagDTO).toList();
}

BackupTagDTO _toBackupTagDTO(Tag tag) {
  return BackupTagDTO(name: tag.name, hexColor: tag.hexColor);
}
