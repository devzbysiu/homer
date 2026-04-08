import '../../../../core/entities/book.dart';
import '../../../../core/entities/tag.dart';
import '../models/exported_book_dto.dart';
import '../models/exported_tag_dto.dart';

List<ExportedBookDTO> toExportedBookDTOs(List<Book> books) {
  return books.map(_toExportedBookDTO).toList();
}

ExportedBookDTO _toExportedBookDTO(Book book) {
  return ExportedBookDTO(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    state: book.state,
    pageCount: book.pageCount,
    isbn: book.isbn,
    thumbnailAddress: book.thumbnailAddress,
    rating: book.rating,
    summary: book.summary,
    tags: _toExportedTagDTOs(book.tags),
    startDate: book.startDate,
    endDate: book.endDate,
  );
}

List<ExportedTagDTO> _toExportedTagDTOs(List<Tag> tags) {
  return tags.map(_toExportedTagDTO).toList();
}

ExportedTagDTO _toExportedTagDTO(Tag tag) {
  return ExportedTagDTO(name: tag.name, hexColor: tag.hexColor);
}
