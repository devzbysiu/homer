import '../../../manage_books/domain/entities/book.dart';
import '../models/backup_book_dto.dart';

List<Book> toBooks(List<BackupBookDTO> books) {
  return books.map(_toBook).toList();
}

Book _toBook(BackupBookDTO book) {
  return Book(
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
