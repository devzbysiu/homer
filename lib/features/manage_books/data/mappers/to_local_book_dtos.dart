import '../../../../core/utils/date_option_ext.dart';
import '../../domain/entities/local_book.dart';
import '../models/local_book_dto.dart';

List<LocalBookDTO> toLocalBookDTOs(List<LocalBook> books) {
  return books.map((book) => toLocalBookDTO(book)).toList();
}

LocalBookDTO toLocalBookDTO(LocalBook book) {
  final bookDTO = LocalBookDTO(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    state: book.state,
    pageCount: book.pageCount,
    isbn: book.isbn,
    thumbnailAddress: book.thumbnailAddress.toNullable(),
    rating: book.rating,
    summary: book.summary.toNullable(),
    tags: book.tags,
    startDate: book.startDate.millisSinceEpoch(),
    endDate: book.endDate.millisSinceEpoch(),
  );
  return book.id != null ? (bookDTO..id = book.id!) : bookDTO;
}
