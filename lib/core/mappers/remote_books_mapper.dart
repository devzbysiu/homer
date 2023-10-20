import 'package:dartz/dartz.dart';

import '../../features/books_listing/domain/entities/local_book.dart';
import '../../features/search/data/models/remote_book_dto.dart';
import '../../features/search/domain/entities/remote_book.dart';
import '../../features/tags_manager/domain/entities/tag.dart';

List<RemoteBook> toRemoteBooks(List<RemoteBookDTO> books) {
  return books.map(_toRemoteBook).toList();
}

RemoteBook _toRemoteBook(RemoteBookDTO remoteBookDTO) {
  return RemoteBook(
    title: remoteBookDTO.title,
    subtitle: remoteBookDTO.subtitle,
    authors: remoteBookDTO.authors,
    pageCount: remoteBookDTO.pageCount,
    isbn: remoteBookDTO.industryIdentifiers.firstOrNull?.toString() ?? '',
    thumbnail: optionOf(remoteBookDTO.imageLinks.values.firstOrNull),
    averageRating: remoteBookDTO.averageRating,
    description: _descriptionOrDefault(remoteBookDTO),
  );
}

LocalBook toLocalBook(
  RemoteBook remoteBook,
  LocalBookState state,
  Set<Tag> tags,
) =>
    LocalBook(
      title: remoteBook.title,
      subtitle: remoteBook.subtitle,
      authors: remoteBook.authors,
      state: state,
      pageCount: remoteBook.pageCount,
      isbn: remoteBook.isbn,
      thumbnailAddress: remoteBook.thumbnail.map((uri) => uri.toString()),
      rating: remoteBook.averageRating,
      summary: remoteBook.description.isEmpty
          ? none()
          : some(remoteBook.description),
      tags: tags,
      dateModified: DateTime.now(),
    );

String _descriptionOrDefault(RemoteBookDTO remoteBookDTO) {
  final description = remoteBookDTO.description ?? '';
  return description.isEmpty ? 'No description.' : description;
}
