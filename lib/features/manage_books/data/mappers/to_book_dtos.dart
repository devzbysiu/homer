import '../../../../core/entities/book.dart';
import '../../../../core/entities/tag.dart';
import '../../../../core/utils/date_option_ext.dart';
import '../models/book_dto.dart';
import '../models/tag_dto.dart';

List<BookDTO> toBookDTOs(List<Book> books) {
  return books.map((book) => toBookDTO(book)).toList();
}

BookDTO toBookDTO(Book book) {
  final bookDTO = BookDTO(
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

BookStateDTO _toBookStateDTO(BookState state) {
  switch (state) {
    case BookState.readLater:
      return BookStateDTO.readLater;
    case BookState.reading:
      return BookStateDTO.reading;
    case BookState.read:
      return BookStateDTO.read;
  }
}

List<TagDTO> _toTagDTOs(List<Tag> tags) {
  return tags.map(_toTagDTO).toList();
}

TagDTO _toTagDTO(Tag tag) {
  return TagDTO()
    ..name = tag.name
    ..hexColor = tag.hexColor;
}
