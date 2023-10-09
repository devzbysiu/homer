import '../../../books_listing/domain/entities/local_book.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import '../../domain/entities/remote_book.dart';
import '../models/remote_book_dto.dart';

final class RemoteBookMapper {
  List<RemoteBook> toBooks(List<RemoteBookDTO> books) {
    return books.map(_toRemoteBook).toList();
  }

  RemoteBook _toRemoteBook(RemoteBookDTO remoteBookDTO) {
    return RemoteBook(
      title: remoteBookDTO.title,
      subtitle: remoteBookDTO.subtitle,
      authors: remoteBookDTO.authors,
      pageCount: remoteBookDTO.pageCount,
      isbn: remoteBookDTO.industryIdentifiers.firstOrNull?.toString() ?? '',
      imageLinks: remoteBookDTO.imageLinks,
      averageRating: remoteBookDTO.averageRating,
      description: remoteBookDTO.description,
    );
  }

  LocalBook toBook(RemoteBook remoteBook, BookState state, Set<Tag> tags) {
    return LocalBook(
      title: remoteBook.title,
      subtitle: remoteBook.subtitle,
      authors: remoteBook.authors,
      state: state,
      pageCount: remoteBook.pageCount,
      isbn: remoteBook.isbn,
      thumbnailAddress: _extractThumbnail(remoteBook),
      rating: remoteBook.averageRating,
      summary: remoteBook.description,
      tags: tags,
    );
  }

  String? _extractThumbnail(RemoteBook book) {
    return book.imageLinks.values.firstOrNull?.toString();
  }
}
