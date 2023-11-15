import 'package:dartz/dartz.dart';

import '../../../../core/entities/book.dart';
import '../models/remote_book_dto.dart';

List<Book> toBooks(List<RemoteBookDTO> books) {
  return books.map(toBook).toList();
}

Book toBook(RemoteBookDTO remoteBookDTO) {
  return Book(
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
