import 'package:homer/core/entities/book.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_book_dto.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_tag_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart';
import 'package:homer/features/settings/data/models/settings_dto.dart';

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
    'startDate': book.startDate.fold(
      () => 0,
      (date) => date.millisecondsSinceEpoch,
    ),
    'endDate': book.endDate.fold(
      () => 0,
      (date) => date.millisecondsSinceEpoch,
    ),
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

Map<String, dynamic> backupTagDTOToJson(BackupTagDTO tag) {
  return {'name': tag.name, 'hexColor': tag.hexColor};
}

Map<String, dynamic> externalBookInfoDTOToJson(ExternalBookInfoDTO dto) {
  return {
    'title': dto.title,
    'isbn10': dto.isbn10.toNullable(),
    'isbn13': dto.isbn13.toNullable(),
  };
}

Map<String, dynamic> settingsDTOToJson(SettingsDTO dto) {
  return {
    'backupsDirectory': dto.backupsDirectory.path,
    'isSystemThemeOn': dto.isSystemThemeOn,
    'isDarkThemeOn': dto.isDarkThemeOn,
    'bookSizeLimits': [
      dto.bookSizeLimits.short.maxPages,
      dto.bookSizeLimits.medium.maxPages,
    ],
    'readingGoal': dto.readingGoal.books,
  };
}
