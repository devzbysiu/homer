import 'package:books_finder/books_finder.dart' as bf;
import 'package:dartz/dartz.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/core/entities/tag.dart';
import 'package:homer/core/utils/date_option_ext.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_book_dto.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_tag_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart';
import 'package:homer/features/find_new_book/domain/entities/external_book_info.dart';
import 'package:homer/features/manage_books/data/models/book_dto.dart';
import 'package:homer/features/manage_books/data/models/tag_dto.dart';
import 'package:homer/features/settings/data/models/settings_dto.dart';
import 'package:homer/features/settings/domain/entities/settings.dart';

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
    alreadySaved: true,
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
    thumbnailAddress: optionOf(
      remoteBookDTO.imageLinks.values.firstOrNull?.toString(),
    ),
    rating: remoteBookDTO.averageRating,
    summary: optionOf(_descriptionOrDefault(remoteBookDTO)),
    tags: const [],
    startDate: none(),
    endDate: none(),
    alreadySaved: false,
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
  return ExternalBookInfo(isbn: bookInfoDTO.isbn, title: bookInfoDTO.title);
}

BookDTO bookDTOFromBook(Book book) {
  final bookDTO = BookDTO(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    state: _toBookStateDTO(book.state),
    pageCount: book.pageCount,
    isbn: book.isbn,
    thumbnailAddress: book.thumbnailAddress.toNullable(),
    rating: book.rating,
    summary: book.summary.toNullable(),
    tags: _toTagDTOs(book.tags),
    startDate: book.startDate.millisSinceEpoch(),
    endDate: book.endDate.millisSinceEpoch(),
  );
  return book.id != null ? (bookDTO..id = book.id!) : bookDTO;
}

BookStateDTO _toBookStateDTO(BookState state) {
  switch (state) {
    case BookState.readLater:
      return BookStateDTO.readLater;
    case BookState.reading:
      return BookStateDTO.reading;
    case BookState.read:
      return BookStateDTO.read;
  }
}

List<TagDTO> _toTagDTOs(List<Tag> tags) {
  return tags.map(_toTagDTO).toList();
}

TagDTO _toTagDTO(Tag tag) {
  return TagDTO()
    ..name = tag.name
    ..hexColor = tag.hexColor;
}

Book bookFromBookDTO(BookDTO bookDTO) {
  return Book(
    id: bookDTO.id,
    title: bookDTO.title,
    subtitle: bookDTO.subtitle,
    authors: bookDTO.authors,
    state: _toBookState(bookDTO.state),
    pageCount: bookDTO.pageCount,
    isbn: bookDTO.isbn,
    thumbnailAddress: optionOf(bookDTO.thumbnailAddress),
    rating: bookDTO.rating,
    summary: optionOf(bookDTO.summary),
    tags: _toBookTags(bookDTO.tags),
    startDate: _toDateTime(bookDTO.startDate),
    endDate: _toDateTime(bookDTO.endDate),
    alreadySaved: true,
  );
}

BookState _toBookState(BookStateDTO state) {
  switch (state) {
    case BookStateDTO.readLater:
      return BookState.readLater;
    case BookStateDTO.reading:
      return BookState.reading;
    case BookStateDTO.read:
      return BookState.read;
  }
}

List<Tag> _toBookTags(List<TagDTO> tags) {
  return tags.map(_toBookTag).toList();
}

Tag _toBookTag(TagDTO tag) {
  return Tag(name: tag.name, hexColor: tag.hexColor);
}

Option<DateTime> _toDateTime(int? millisSinceEpoch) {
  return millisSinceEpoch == null || millisSinceEpoch == 0
      ? none()
      : some(DateTime.fromMillisecondsSinceEpoch(millisSinceEpoch));
}

SettingsDTO settingsDTOFromSettings(Settings settings) {
  return SettingsDTO(
    isDarkThemeOn: settings.useDarkTheme,
    isSystemThemeOn: settings.useSystemTheme,
    backupsDirectory: settings.backupsDir,
    bookSizeLimits: settings.bookSizeLimits,
    readingGoal: settings.readingGoal,
  );
}

Settings settingsFromSettingsDTO(SettingsDTO settingsDTO) {
  return Settings(
    useDarkTheme: settingsDTO.isDarkThemeOn,
    useSystemTheme: settingsDTO.isSystemThemeOn,
    backupsDir: settingsDTO.backupsDirectory,
    bookSizeLimits: settingsDTO.bookSizeLimits,
    readingGoal: settingsDTO.readingGoal,
  );
}
