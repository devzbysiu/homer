import '../../../manage_books/domain/entities/local_book.dart';
import '../models/local_backup_book_dto.dart';

List<LocalBackupBookDTO> toLocalBackupBookDTOs(List<LocalBook> books) {
  return books.map(_toLocalBackupBookDTO).toList();
}

LocalBackupBookDTO _toLocalBackupBookDTO(LocalBook book) {
  return LocalBackupBookDTO(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    state: book.state,
    pageCount: book.pageCount,
    isbn: book.isbn,
    thumbnailAddress: book.thumbnailAddress,
    rating: book.rating,
    summary: book.summary,
    tags: book.tags,
    startDate: book.startDate,
    endDate: book.endDate,
  );
}
