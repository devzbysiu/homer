import 'package:dartz/dartz.dart';

import '../../../manage_books/domain/entities/local_book.dart';
import '../models/remote_book_dto.dart';

List<LocalBook> toLocalBooks(List<RemoteBookDTO> books) {
  return books.map(toLocalBook).toList();
}

LocalBook toLocalBook(RemoteBookDTO remoteBookDTO) {
  return LocalBook(
    title: remoteBookDTO.title,
    subtitle: remoteBookDTO.subtitle,
    authors: remoteBookDTO.authors,
    state: BookState.readLater,
    pageCount: remoteBookDTO.pageCount,
    isbn: remoteBookDTO.industryIdentifiers.firstOrNull ?? '',
    thumbnailAddress:
        optionOf(remoteBookDTO.imageLinks.values.firstOrNull?.toString()),
    rating: remoteBookDTO.averageRating,
    summary: optionOf(_descriptionOrDefault(remoteBookDTO)),
    tags: const [],
    startDate: none(),
    endDate: none(),
  );
}

String _descriptionOrDefault(RemoteBookDTO remoteBookDTO) {
  final description = remoteBookDTO.description ?? '';
  return description.isEmpty ? 'No description.' : description;
}
