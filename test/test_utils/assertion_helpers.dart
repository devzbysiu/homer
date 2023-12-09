import 'package:books_finder/books_finder.dart' as bf;
import 'package:dartz/dartz.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/entities/tag.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_book_dto.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_tag_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart';
import 'package:homer/features/find_new_book/domain/entities/external_book_info.dart';

BackupBookDTO backupDTOFromBook(Book book) {
  return BackupBookDTO(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    state: book.state,
    pageCount: book.pageCount,
    isbn: book.isbn,
    thumbnailAddress: book.thumbnailAddress,
    rating: book.rating,
    summary: book.summary,
    tags: _toBackupTagDTOs(book.tags),
    startDate: book.startDate,
    endDate: book.endDate,
  );
}

List<BackupTagDTO> _toBackupTagDTOs(List<Tag> tags) {
  return tags.map(_toBackupTagDTO).toList();
}

BackupTagDTO _toBackupTagDTO(Tag tag) {
  return BackupTagDTO(name: tag.name, hexColor: tag.hexColor);
}

Book bookFromBackupDTO(BackupBookDTO book) {
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
  );
}

List<Tag> _toTags(List<BackupTagDTO> tags) {
  return tags.map(_toTag).toList();
}

Tag _toTag(BackupTagDTO tag) {
  return Tag(name: tag.name, hexColor: tag.hexColor);
}

Book bookFromExternalBookDTO(ExternalBookDTO remoteBookDTO) {
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

String _descriptionOrDefault(ExternalBookDTO remoteBookDTO) {
  final description = remoteBookDTO.description ?? '';
  return description.isEmpty ? 'No description.' : description;
}

ExternalBookDTO fromBookFinderBook(bf.Book book) {
  return ExternalBookDTO(
    title: book.info.title,
    subtitle: book.info.subtitle,
    authors: book.info.authors,
    pageCount: book.info.pageCount,
    industryIdentifiers:
        book.info.industryIdentifiers.map((isbn) => isbn.identifier).toList(),
    imageLinks: book.info.imageLinks,
    averageRating: book.info.averageRating,
    description: book.info.description,
  );
}

ExternalBookInfo externalBookInfoFromDTO(ExternalBookInfoDTO bookInfoDTO) {
  return ExternalBookInfo(
    isbn: bookInfoDTO.isbn.toNullable()!,
    title: bookInfoDTO.title,
  );
}
