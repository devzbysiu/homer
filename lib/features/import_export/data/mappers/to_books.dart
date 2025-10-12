import '../../../../core/entities/book.dart';
import '../../../../core/entities/tag.dart';
import '../models/exported_book_dto.dart';
import '../models/exported_tag_dto.dart';

List<Book> toBooks(List<ExportedBookDTO> books) {
  return books.map(_toBook).toList();
}

Book _toBook(ExportedBookDTO book) {
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
    tags: _toTags(book.tags),
    startDate: book.startDate,
    endDate: book.endDate,
    alreadySaved: true,
  );
}

List<Tag> _toTags(List<ExportedTagDTO> tags) {
  return tags.map(_toTag).toList();
}

Tag _toTag(ExportedTagDTO tag) {
  return Tag(name: tag.name, hexColor: tag.hexColor);
}
