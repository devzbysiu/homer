import 'package:dartz/dartz.dart';

import '../../../tags_manager/domain/entities/tag.dart';
import '../../domain/entities/local_book.dart';
import '../models/local_book_dto.dart';

List<LocalBook> toLocalBooks(List<LocalBookDTO> bookModels) {
  return bookModels.map(_toLocalBook).toList();
}

LocalBook _toLocalBook(LocalBookDTO bookDTO) {
  return LocalBook(
    id: bookDTO.id,
    title: bookDTO.title,
    subtitle: bookDTO.subtitle,
    authors: bookDTO.authors,
    state: bookDTO.state,
    pageCount: bookDTO.pageCount,
    isbn: bookDTO.isbn,
    thumbnailAddress: optionOf(bookDTO.thumbnailAddress),
    rating: bookDTO.rating,
    summary: optionOf(bookDTO.summary),
    tags: bookDTO.tags,
    startDate: _toDateTime(bookDTO.startDate),
    endDate: _toDateTime(bookDTO.endDate),
  );
}

Option<DateTime> _toDateTime(int? millisSinceEpoch) {
  return millisSinceEpoch == null || millisSinceEpoch == 0
      ? none()
      : some(DateTime.fromMillisecondsSinceEpoch(millisSinceEpoch));
}

LocalBook toLocalBook(
  LocalBook localBook,
  BookState state,
  List<Tag> tags,
) {
  return LocalBook(
    title: localBook.title,
    subtitle: localBook.subtitle,
    authors: localBook.authors,
    state: state,
    pageCount: localBook.pageCount,
    isbn: localBook.isbn,
    thumbnailAddress: localBook.thumbnailAddress,
    rating: localBook.rating,
    summary: localBook.summary,
    tags: tags,
    startDate: none(),
    endDate: none(),
  );
}
