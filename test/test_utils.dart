import 'package:books_finder/books_finder.dart' as bf;
import 'package:dartz/dartz.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/entities/tag.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_book_dto.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_tag_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart';
import 'package:multiple_result/multiple_result.dart' as mr;

BackupBookDTO backupBookDTOFromJson(Map<String, dynamic> json) {
  return BackupBookDTO(
    title: json['title'],
    subtitle: json['subtitle'],
    authors: json['authors'],
    state: stateFromString(json['state']),
    pageCount: json['pageCount'],
    isbn: json['isbn'],
    thumbnailAddress: some(json['thumbnailAddress']),
    rating: json['rating'],
    summary: some(json['summary']),
    tags: tagDTOsFromJson(json['tags']),
    startDate: some(DateTime.fromMillisecondsSinceEpoch(json['startDate'])),
    endDate: some(DateTime.fromMillisecondsSinceEpoch(json['endDate'])),
  );
}

BookState stateFromString(String state) {
  switch (state) {
    case 'readLater':
      return BookState.readLater;
    case 'reading':
      return BookState.reading;
    case 'read':
      return BookState.read;
    default:
      throw Exception('should not happen');
  }
}

List<BackupTagDTO> tagDTOsFromJson(List<Map<String, dynamic>> tags) {
  return tags.map(tagFromJson).toList();
}

BackupTagDTO tagFromJson(Map<String, dynamic> tagJson) {
  return BackupTagDTO(name: tagJson['name'], hexColor: tagJson['hexColor']);
}

Map<String, dynamic> backupBookDTOToJson(BackupBookDTO book) {
  return {
    'title': book.title,
    'subtitle': book.subtitle,
    'authors': book.authors,
    'state': _bookStateToString(book.state),
    'pageCount': book.pageCount,
    'isbn': book.isbn,
    'thumbnailAddress': book.thumbnailAddress.getOrElse(() => ''),
    'rating': book.rating,
    'summary': book.summary.getOrElse(() => ''),
    'tags': book.tags,
    'startDate':
        book.startDate.fold(() => 0, (date) => date.millisecondsSinceEpoch),
    'endDate':
        book.endDate.fold(() => 0, (date) => date.millisecondsSinceEpoch),
  };
}

String _bookStateToString(BookState state) {
  switch (state) {
    case BookState.readLater:
      return 'readLater';
    case BookState.reading:
      return 'reading';
    case BookState.read:
      return 'read';
  }
}

BackupTagDTO backupTagDTOFromJson(Map<String, dynamic> json) {
  return BackupTagDTO(name: json['name'], hexColor: json['hexColor']);
}

Map<String, dynamic> backupTagDTOToJson(BackupTagDTO tag) {
  return {
    'name': tag.name,
    'hexColor': tag.hexColor,
  };
}

final class TestingFailure implements Failure {
  @override
  String userMessage() => 'This is test failure';
}

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

Book bookFromRemoteDTO(ExternalBookDTO remoteBookDTO) {
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

ExternalBookInfoDTO externalBookInfoDTOFromJson(Map<String, dynamic> json) {
  return ExternalBookInfoDTO(
    title: json['title'],
    isbn10: optionOf(json['isbn10']),
    isbn13: optionOf(json['isbn13']),
  );
}

Map<String, dynamic> externalBookInfoDTOToJson(ExternalBookInfoDTO dto) {
  return {
    'title': dto.title,
    'isbn10': dto.isbn10.toNullable(),
    'isbn13': dto.isbn13.toNullable(),
  };
}

Future<T> withIt<T>(T books) {
  return Future.value(books);
}

Future<mr.Unit> withUnit() {
  return Future.value(mr.unit);
}

Future<mr.Result<T, Failure>> withSuccess<T>(T books) {
  return Future.value(mr.Success(books));
}

Future<mr.Result<T, Failure>> withFailure<T>(Failure failure) {
  return Future.value(mr.Error(failure));
}

extension ExternalBookInfoDTOCopyWith on ExternalBookInfoDTO {
  ExternalBookInfoDTO copyWith({
    String? title,
    Option<String>? isbn10,
    Option<String>? isbn13,
  }) {
    return ExternalBookInfoDTO(
      title: title ?? this.title,
      isbn10: isbn10 ?? this.isbn10,
      isbn13: isbn13 ?? this.isbn13,
    );
  }
}
