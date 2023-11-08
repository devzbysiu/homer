import 'package:dartz/dartz.dart';

import '../../features/find_new_book/data/models/remote_book_dto.dart';
import '../../features/find_new_book/domain/entities/remote_book.dart';
import '../../features/manage_books/domain/entities/local_book.dart';
import '../../features/tags_manager/domain/entities/tag.dart';

// ================ [ RemoteBookDTO to RemoteBook ] =====================

List<RemoteBook> toRemoteBooks(List<RemoteBookDTO> books) {
  return books.map(toRemoteBook).toList();
}

RemoteBook toRemoteBook(RemoteBookDTO remoteBookDTO) {
  return RemoteBook(
    title: remoteBookDTO.title,
    subtitle: remoteBookDTO.subtitle,
    authors: remoteBookDTO.authors,
    pageCount: remoteBookDTO.pageCount,
    isbn: remoteBookDTO.industryIdentifiers.firstOrNull ?? '',
    thumbnail: optionOf(remoteBookDTO.imageLinks.values.firstOrNull),
    averageRating: remoteBookDTO.averageRating,
    description: _descriptionOrDefault(remoteBookDTO),
  );
}

String _descriptionOrDefault(RemoteBookDTO remoteBookDTO) {
  final description = remoteBookDTO.description ?? '';
  return description.isEmpty ? 'No description.' : description;
}

// ================ [ RemoteBook to LocalBook ] =====================

LocalBook toLocalBook(
  RemoteBook remoteBook,
  LocalBookState state,
  List<Tag> tags,
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
      startDate: none(),
      endDate: none(),
    );
