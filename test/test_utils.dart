import 'package:books_finder/books_finder.dart' as bf;
import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/entities/tag.dart';
import 'package:homer/core/error/failures.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_book_dto.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_tag_dto.dart';
import 'package:homer/features/find_new_book/data/models/book_info_dto.dart';
import 'package:homer/features/find_new_book/data/models/remote_book_dto.dart';

Book fakeBook() {
  return Book(
    title: _fakeTitle(),
    subtitle: _fakeSubtitle(),
    authors: [_fakeAuthor()],
    state: _fakeBookState(),
    pageCount: _fakePageCount(),
    isbn: _fakeIsbn(),
    thumbnailAddress: some(_fakeThumbnailAddress()),
    rating: _fakeRating(),
    summary: some(_fakeSummary()),
    tags: [fakeTag(), fakeTag()],
    startDate: some(_fakeDate()),
    endDate: some(_fakeDate()),
  );
}

String _fakeTitle() => _fakeTagName();

String _fakeSubtitle() => faker.lorem.sentence();

String _fakeAuthor() => faker.person.name();

int _fakePageCount() => faker.randomGenerator.integer(1024);

String _fakeIsbn() => faker.guid.guid();

String _fakeThumbnailAddress() => faker.internet.httpsUrl();

double _fakeRating() => faker.randomGenerator.decimal(scale: 5);

String _fakeSummary() => faker.lorem.sentences(7).join(' ');

String _fakeTagColor() => faker.color.color();

String _fakeTagName() => faker.lorem.word();

int _fakeDateMillis() => faker.date.dateTime().millisecondsSinceEpoch;

DateTime _fakeDate() => faker.date.dateTime(minYear: 1990, maxYear: 2023);

Tag fakeTag() => Tag(name: _fakeTagName(), hexColor: _fakeTagColor());

Map<String, Object> fakeBackupBookDTOJson() {
  return {
    'title': _fakeTitle(),
    'subtitle': _fakeSubtitle(),
    'authors': [_fakeAuthor()],
    'state': _fakeBookStateString(),
    'pageCount': _fakePageCount(),
    'isbn': _fakeIsbn(),
    'thumbnailAddress': _fakeThumbnailAddress(),
    'rating': _fakeRating(),
    'summary': _fakeSummary(),
    'tags': [
      {
        'name': _fakeTagName(),
        'hexColor': _fakeTagColor(),
      },
    ],
    'startDate': _fakeDateMillis(),
    'endDate': _fakeDateMillis(),
  };
}

String _fakeBookStateString() {
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
    title: _fakeTitle(),
    subtitle: _fakeSubtitle(),
    authors: [_fakeAuthor()],
    state: _fakeBookState(),
    pageCount: _fakePageCount(),
    isbn: _fakeIsbn(),
    thumbnailAddress: some(_fakeThumbnailAddress()),
    rating: _fakeRating(),
    summary: some(_fakeSummary()),
    tags: [
      BackupTagDTO(name: _fakeTagName(), hexColor: _fakeTagColor()),
      BackupTagDTO(name: _fakeTagName(), hexColor: _fakeTagColor()),
    ],
    startDate: some(_fakeDate()),
    endDate: some(_fakeDate()),
  );
}

BookState _fakeBookState() {
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

RemoteBookDTO fakeRemoteBookDTO() {
  return RemoteBookDTO(
    title: _fakeTitle(),
    subtitle: _fakeSubtitle(),
    authors: [_fakeAuthor()],
    pageCount: _fakePageCount(),
    industryIdentifiers: [_fakeIsbn()],
    imageLinks: {faker.lorem.word(): Uri.parse(faker.internet.httpsUrl())},
    averageRating: _fakeRating(),
    description: _fakeSummary(),
  );
}

Book bookFromRemoteDTO(RemoteBookDTO remoteBookDTO) {
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

bf.Book fakeBookFinderBook() {
  return bf.Book(
    id: '',
    info: _fakeBookFinderBookInfo(),
    saleInfo: const bf.SaleInfo(country: '', saleability: '', isEbook: true),
  );
}

bf.BookInfo _fakeBookFinderBookInfo() {
  return bf.BookInfo(
    title: _fakeTitle(),
    subtitle: _fakeSubtitle(),
    authors: [_fakeAuthor()],
    publisher: '',
    averageRating: _fakeRating(),
    categories: [],
    contentVersion: '',
    description: _fakeSummary(),
    industryIdentifiers: [
      bf.IndustryIdentifier(type: '', identifier: _fakeIsbn()),
    ],
    imageLinks: {'url': Uri.parse(_fakeThumbnailAddress())},
    language: '',
    maturityRating: '',
    pageCount: _fakePageCount(),
    publishedDate: null,
    rawPublishedDate: '',
    ratingsCount: 1,
    previewLink: Uri.parse('https://google.com'),
    infoLink: Uri.parse('https://google.com'),
    canonicalVolumeLink: Uri.parse('https://google.com'),
  );
}

RemoteBookDTO fromBookFinderBook(bf.Book book) {
  return RemoteBookDTO(
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

Map<String, dynamic> fakeBookInfoDTOJson() {
  return {
    'title': _fakeTitle(),
    'isbn10': _fakeIsbn(),
    'isbn13': _fakeIsbn(),
  };
}

BookInfoDTO bookInfoDTOFromJson(Map<String, dynamic> json) {
  return BookInfoDTO(
    title: json['title'],
    isbn10: optionOf(json['isbn10']),
    isbn13: optionOf(json['isbn13']),
  );
}

BookInfoDTO fakeBookInfoDTO() {
  return BookInfoDTO(
    title: _fakeTitle(),
    isbn10: Some(_fakeIsbn()),
    isbn13: Some(_fakeIsbn()),
  );
}

Map<String, dynamic> bookInfoDTOToJson(BookInfoDTO dto) {
  return {
    'title': dto.title,
    'isbn10': dto.isbn10.toNullable(),
    'isbn13': dto.isbn13.toNullable(),
  };
}
