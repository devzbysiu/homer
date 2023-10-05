import '../../../tags_manager/domain/entities/tag.dart';
import '../../domain/entities/book.dart';
import '../models/book_dto.dart';
import '../models/tag_dto.dart';

final class BookMapper {
  List<Book> toBooks(List<BookDTO> bookModels) {
    return bookModels.map(_toBook).toList();
  }

  Book _toBook(BookDTO bookDTO) => Book(
        title: bookDTO.title,
        subtitle: bookDTO.subtitle,
        author: bookDTO.author,
        state: _toBookState(bookDTO.state),
        pageCount: bookDTO.pageCount,
        isbn: bookDTO.isbn,
        thumbnailAddress: bookDTO.thumbnailAddress,
        startDate: bookDTO.startDate,
        endDate: bookDTO.endDate,
        rating: bookDTO.rating,
        summary: bookDTO.summary,
        tags: _toBookTags(bookDTO.tags),
      );

  BookDTO toBookDTO(Book book) => BookDTO(
        title: book.title,
        subtitle: book.subtitle,
        author: book.author,
        state: _toBookStateDTO(book.state),
        pageCount: book.pageCount,
        isbn: book.isbn,
        thumbnailAddress: book.thumbnailAddress,
        startDate: book.startDate,
        endDate: book.endDate,
        rating: book.rating,
        summary: book.summary,
        tags: _toTagDTOs(book.tags),
      );

  BookState _toBookState(BookStateDTO state) {
    switch (state) {
      case BookStateDTO.readLater:
        return BookState.readLater;
      case BookStateDTO.reading:
        return BookState.reading;
      case BookStateDTO.read:
        return BookState.read;
    }
  }

  Set<Tag> _toBookTags(List<TagDTO> tags) {
    return tags
        .map((tagModel) => Tag(
              name: tagModel.name,
              color: _toTagColor(tagModel.color),
            ))
        .toSet();
  }

  TagColor _toTagColor(TagColorDTO color) {
    switch (color) {
      case TagColorDTO.brown:
        return TagColor.brown;
      case TagColorDTO.black:
        return TagColor.black;
      case TagColorDTO.green:
        return TagColor.green;
      case TagColorDTO.blue:
        return TagColor.blue;
      case TagColorDTO.orange:
        return TagColor.orange;
      case TagColorDTO.red:
        return TagColor.red;
    }
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

  List<TagDTO> _toTagDTOs(Set<Tag> tags) {
    return tags
        .map((tag) => TagDTO()
          ..name = tag.name
          ..color = _toTagColorDTO(tag.color))
        .toList();
  }

  TagColorDTO _toTagColorDTO(TagColor color) {
    switch (color) {
      case TagColor.brown:
        return TagColorDTO.brown;
      case TagColor.black:
        return TagColorDTO.black;
      case TagColor.green:
        return TagColorDTO.green;
      case TagColor.blue:
        return TagColorDTO.blue;
      case TagColor.orange:
        return TagColorDTO.orange;
      case TagColor.red:
        return TagColorDTO.red;
    }
  }
}
