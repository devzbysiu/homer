import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:homer/core/entities/book.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_book_dto.dart';
import 'package:homer/features/backup_and_restore/data/models/backup_tag_dto.dart';
import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart';
import 'package:homer/features/settings/data/models/settings_dto.dart';
import 'package:homer/features/settings/domain/entities/book_size_limits.dart';

BackupBookDTO backupBookDTOFromJson(Map<String, dynamic> json) {
  return BackupBookDTO(
    title: json['title'],
    subtitle: json['subtitle'],
    authors: json['authors'],
    state: _stateFromString(json['state']),
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

BookState _stateFromString(String state) {
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

BackupTagDTO backupTagDTOFromJson(Map<String, dynamic> json) {
  return BackupTagDTO(name: json['name'], hexColor: json['hexColor']);
}

ExternalBookInfoDTO externalBookInfoDTOFromJson(Map<String, dynamic> json) {
  return ExternalBookInfoDTO(
    title: json['title'],
    isbn10: optionOf(json['isbn10']),
    isbn13: optionOf(json['isbn13']),
  );
}

SettingsDTO settingsDTOFromJson(Map<String, dynamic> json) {
  final bookSizeLimits = json['bookSizeLimits'];
  return SettingsDTO(
    isSystemThemeOn: json['isSystemThemeOn'],
    isDarkThemeOn: json['isDarkThemeOn'],
    backupsDirectory: Directory(json['backupsDirectory']),
    bookSizeLimits: BookSizeLimits(
      shortMax: bookSizeLimits[0],
      mediumMax: bookSizeLimits[1],
    ),
  );
}
