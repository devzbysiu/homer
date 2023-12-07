import 'package:books_finder/books_finder.dart' as bf;
import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/entities/tag.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_book_dto.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_tag_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart';
import 'package:multiple_result/multiple_result.dart' as mr;

Book fakeBook() {
  return Book(
    title: fakeTitle(),
    subtitle: fakeSubtitle(),
    authors: [fakeAuthor()],
    state: fakeBookState(),
    pageCount: fakePageCount(),
    isbn: fakeIsbn(),
    thumbnailAddress: some(fakeThumbnailAddress()),
    rating: fakeRating(),
    summary: some(fakeSummary()),
    tags: [fakeTag(), fakeTag()],
    startDate: some(fakeDate()),
    endDate: some(fakeDate()),
  );
}

String fakeTitle() => fakeTagName();

String fakeSubtitle() => faker.lorem.sentence();

String fakeAuthor() => faker.person.name();

int fakePageCount() => faker.randomGenerator.integer(1024);

String fakeIsbn() => faker.guid.guid();

String fakeThumbnailAddress() => fakeUrl();

String fakeUrl() => faker.internet.httpsUrl();

double fakeRating() => faker.randomGenerator.decimal(scale: 5);

String fakeSummary() => faker.lorem.sentences(7).join(' ');

String fakeTagColor() => faker.color.color();

String fakeTagName() => faker.lorem.word();

int fakeDateMillis() => faker.date.dateTime().millisecondsSinceEpoch;

DateTime fakeDate() => faker.date.dateTime(minYear: 1990, maxYear: 2023);

Tag fakeTag() => Tag(name: fakeTagName(), hexColor: fakeTagColor());

Map<String, Object> fakeBackupBookDTOJson() {
  return {
    'title': fakeTitle(),
    'subtitle': fakeSubtitle(),
    'authors': [fakeAuthor()],
    'state': fakeBookStateString(),
    'pageCount': fakePageCount(),
    'isbn': fakeIsbn(),
    'thumbnailAddress': fakeThumbnailAddress(),
    'rating': fakeRating(),
    'summary': fakeSummary(),
    'tags': [
      {
        'name': fakeTagName(),
        'hexColor': fakeTagColor(),
      },
    ],
    'startDate': fakeDateMillis(),
    'endDate': fakeDateMillis(),
  };
}

String fakeBookStateString() {
  switch (faker.randomGenerator.integer(4, min: 1)) {
    case 1:
      return 'readLater';
    case 2:
      return 'reading';
    case 3:
      return 'read';
    default:
      throw Exception('Should not happen');
  }
}

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

BackupBookDTO fakeBackupBookDTO() {
  return BackupBookDTO(
    title: fakeTitle(),
    subtitle: fakeSubtitle(),
    authors: [fakeAuthor()],
    state: fakeBookState(),
    pageCount: fakePageCount(),
    isbn: fakeIsbn(),
    thumbnailAddress: some(fakeThumbnailAddress()),
    rating: fakeRating(),
    summary: some(fakeSummary()),
    tags: [
      BackupTagDTO(name: fakeTagName(), hexColor: fakeTagColor()),
      BackupTagDTO(name: fakeTagName(), hexColor: fakeTagColor()),
    ],
    startDate: some(fakeDate()),
    endDate: some(fakeDate()),
  );
}

BookState fakeBookState() {
  switch (faker.randomGenerator.integer(4, min: 1)) {
    case 1:
      return BookState.readLater;
    case 2:
      return BookState.reading;
    case 3:
      return BookState.read;
    default:
      throw Exception('Should not happen');
  }
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

Map<String, dynamic> fakeBackupTagDTOJson() {
  return {
    'name': faker.lorem.word(),
    'hexColor': faker.color.color(),
  };
}

BackupTagDTO backupTagDTOFromJson(Map<String, dynamic> json) {
  return BackupTagDTO(name: json['name'], hexColor: json['hexColor']);
}

BackupTagDTO fakeBackupTagDTO() {
  return BackupTagDTO(name: faker.lorem.word(), hexColor: faker.color.color());
}

Map<String, dynamic> backupTagDTOToJson(BackupTagDTO tag) {
  return {
    'name': tag.name,
    'hexColor': tag.hexColor,
  };
}

String fakePath() => '/${faker.lorem.words(3).join('/')}';

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

ExternalBookDTO fakeRemoteBookDTO() {
  return ExternalBookDTO(
    title: fakeTitle(),
    subtitle: fakeSubtitle(),
    authors: [fakeAuthor()],
    pageCount: fakePageCount(),
    industryIdentifiers: [fakeIsbn()],
    imageLinks: {faker.lorem.word(): Uri.parse(faker.internet.httpsUrl())},
    averageRating: fakeRating(),
    description: fakeSummary(),
  );
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

bf.Book fakeBookFinderBook() {
  return bf.Book(
    id: '',
    info: fakeBookFinderBookInfo(),
    saleInfo: const bf.SaleInfo(country: '', saleability: '', isEbook: true),
  );
}

bf.BookInfo fakeBookFinderBookInfo() {
  return bf.BookInfo(
    title: fakeTitle(),
    subtitle: fakeSubtitle(),
    authors: [fakeAuthor()],
    publisher: '',
    averageRating: fakeRating(),
    categories: [],
    contentVersion: '',
    description: fakeSummary(),
    industryIdentifiers: [
      bf.IndustryIdentifier(type: '', identifier: fakeIsbn()),
    ],
    imageLinks: {'url': Uri.parse(fakeThumbnailAddress())},
    language: '',
    maturityRating: '',
    pageCount: fakePageCount(),
    publishedDate: null,
    rawPublishedDate: '',
    ratingsCount: 1,
    previewLink: Uri.parse('https://google.com'),
    infoLink: Uri.parse('https://google.com'),
    canonicalVolumeLink: Uri.parse('https://google.com'),
  );
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

Map<String, dynamic> fakeExternalBookInfoDTOJson() {
  return {
    'title': fakeTitle(),
    'isbn10': fakeIsbn(),
    'isbn13': fakeIsbn(),
  };
}

ExternalBookInfoDTO externalBookInfoDTOFromJson(Map<String, dynamic> json) {
  return ExternalBookInfoDTO(
    title: json['title'],
    isbn10: optionOf(json['isbn10']),
    isbn13: optionOf(json['isbn13']),
  );
}

ExternalBookInfoDTO fakeExternalBookInfoDTO() {
  return ExternalBookInfoDTO(
    title: fakeTitle(),
    isbn10: Some(fakeIsbn()),
    isbn13: Some(fakeIsbn()),
  );
}

Map<String, dynamic> externalBookInfoDTOToJson(ExternalBookInfoDTO dto) {
  return {
    'title': dto.title,
    'isbn10': dto.isbn10.toNullable(),
    'isbn13': dto.isbn13.toNullable(),
  };
}

ExternalBookDTO fakeExternalBookDTO() {
  return ExternalBookDTO(
    title: fakeTitle(),
    subtitle: fakeSubtitle(),
    authors: [fakeAuthor()],
    pageCount: fakePageCount(),
    industryIdentifiers: [fakeIsbn()],
    imageLinks: {'url': Uri.parse(fakeThumbnailAddress())},
    averageRating: fakeRating(),
    description: fakeSummary(),
  );
}

String fakeSearchQuery() => faker.lorem.word();

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
