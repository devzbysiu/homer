import 'dart:io';

import 'package:books_finder/books_finder.dart' as bf;
import 'package:dartz/dartz.dart';
import 'package:faker/faker.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/entities/tag.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_book_dto.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_tag_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart';
import 'package:homer/features/find_new_book/domain/entities/external_book_info.dart';
import 'package:homer/features/manage_books/data/models/book_dto.dart';
import 'package:homer/features/manage_books/data/models/tag_dto.dart';
import 'package:homer/features/settings/data/models/settings_dto.dart';
import 'package:homer/features/settings/domain/entities/book_size_limits.dart';
import 'package:homer/features/settings/domain/entities/settings.dart';

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
    alreadySaved: false,
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

Map<String, dynamic> fakeBackupTagDTOJson() {
  return {
    'name': faker.lorem.word(),
    'hexColor': faker.color.color(),
  };
}

BackupTagDTO fakeBackupTagDTO() {
  return BackupTagDTO(name: faker.lorem.word(), hexColor: faker.color.color());
}

String fakePath() => '/${faker.lorem.words(3).join('/')}';

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

Map<String, dynamic> fakeExternalBookInfoDTOJson() {
  return {
    'title': fakeTitle(),
    'isbn10': fakeIsbn(),
    'isbn13': fakeIsbn(),
  };
}

ExternalBookInfoDTO fakeExternalBookInfoDTO() {
  return ExternalBookInfoDTO(
    title: fakeTitle(),
    isbn10: Some(fakeIsbn()),
    isbn13: Some(fakeIsbn()),
  );
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

ExternalBookInfo fakeExternalBookInfo() {
  return ExternalBookInfo(
    title: fakeTitle(),
    isbn: fakeIsbn(),
  );
}

BookDTO fakeBookDTO() {
  return BookDTO(
    title: fakeTitle(),
    subtitle: fakeSubtitle(),
    authors: [fakeAuthor()],
    state: fakeBookStateDTO(),
    pageCount: fakePageCount(),
    isbn: fakeIsbn(),
    thumbnailAddress: fakeThumbnailAddress(),
    rating: fakeRating(),
    summary: fakeSummary(),
    tags: [
      TagDTO()
        ..name = fakeTagName()
        ..hexColor = fakeTagColor(),
      TagDTO()
        ..name = fakeTagName()
        ..hexColor = fakeTagColor(),
    ],
    startDate: fakeDateMillis(),
    endDate: fakeDateMillis(),
  );
}

BookStateDTO fakeBookStateDTO() {
  switch (faker.randomGenerator.integer(4, min: 1)) {
    case 1:
      return BookStateDTO.readLater;
    case 2:
      return BookStateDTO.reading;
    case 3:
      return BookStateDTO.read;
    default:
      throw Exception('Should not happen');
  }
}

Settings fakeSettings() {
  return Settings(
    isSystemThemeOn: fakeBool(),
    isDarkThemeOn: fakeBool(),
    backupsDirectory: Directory(fakePath()),
    bookSizeLimits: BookSizeLimits(
      shortMax: faker.randomGenerator.integer(100),
      mediumMax: faker.randomGenerator.integer(min: 100, 200),
    ),
  );
}

bool fakeBool() => faker.randomGenerator.boolean();

SettingsDTO fakeSettingsDTO() {
  return SettingsDTO(
    isSystemThemeOn: fakeBool(),
    isDarkThemeOn: fakeBool(),
    backupsDirectory: Directory(fakePath()),
    bookSizeLimits: BookSizeLimits(
      shortMax: faker.randomGenerator.integer(100),
      mediumMax: faker.randomGenerator.integer(min: 100, 200),
    ),
  );
}

Map<String, dynamic> fakeSettingsDTOJson() {
  return {
    'isSystemThemeOn': fakeBool(),
    'isDarkThemeOn': fakeBool(),
    'backupsDirectory': fakePath(),
    'bookSizeLimits': [
      faker.randomGenerator.integer(100),
      faker.randomGenerator.integer(min: 100, 200),
    ],
  };
}
