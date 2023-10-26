// TODO: This file should be removed after successful move from dante
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/material.dart';

import '../../../book_summary/domain/entities/local_book.dart';
import '../../../tags_manager/domain/entities/tag.dart';
import '../../domain/entities/restored_book.dart';
import '../models/dante_backup_dto.dart';
import '../models/local_backup_book_dto.dart';

abstract class LocalBackupDataSource {
  Future<List<DanteBackupDTO>> loadDanteAll(String path);

  Future<List<LocalBackupBookDTO>> loadAll(String path);

  Future<Unit> saveAll(String path, List<LocalBackupBookDTO> books);
}

final class BackupDataSource implements LocalBackupDataSource {
  @override
  Future<List<DanteBackupDTO>> loadDanteAll(String path) async {
    final backupFile = File(path);
    final backupContent = await backupFile.readAsString();
    final json = jsonDecode(backupContent);
    final jsonBooks = json['books'] as List;
    final restoredBookDTOs =
        jsonBooks.map((jsonBook) => DanteBackupDTO.fromJson(jsonBook)).toList();
    return Future.value(restoredBookDTOs);
  }

  @override
  Future<List<LocalBackupBookDTO>> loadAll(String path) async {
    final backupFile = File(path);
    final backupContent = await backupFile.readAsString();
    final jsonBooks = jsonDecode(backupContent) as List;
    final restoredBookDTOs = jsonBooks
        .map((jsonBook) => LocalBackupBookDTO.fromJson(jsonBook))
        .toList();
    return Future.value(restoredBookDTOs);
  }

  @override
  Future<Unit> saveAll(String path, List<LocalBackupBookDTO> books) async {
    final jsonBooks = books.map((book) => book.toJson()).toList();
    final backupContent = jsonEncode(jsonBooks);
    final backupFile = File(path);
    await backupFile.writeAsString(backupContent);
    return Future.value(unit);
  }
}

List<RestoredBook> fromDanteToRestoredBooks(
    List<DanteBackupDTO> danteBackupDTOs) {
  final restoredBooks = danteBackupDTOs.map(_fromDanteToRestoredBook).toList();
  for (var book in restoredBooks) {
    book.tags.removeWhere((tag) => tag.title.contains('size:'));
    if (book.tags.where((tag) => tag.title == 'type:technical').isNotEmpty) {
      book.tags.removeWhere((tag) => tag.title == 'type:technical');
      book.tags.add(
        RestoredTag(
          title: 'technical',
          hexColor: Colors.brown.hex,
        ),
      );
    }
  }
  return restoredBooks;
}

RestoredBook _fromDanteToRestoredBook(DanteBackupDTO danteBackupDTO) =>
    RestoredBook(
      title: danteBackupDTO.title,
      subtitle: danteBackupDTO.subTitle,
      authors: [danteBackupDTO.author],
      state: _fromDanteToRestoredBookState(danteBackupDTO.state),
      pageCount: danteBackupDTO.pageCount,
      isbn: danteBackupDTO.isbn,
      thumbnailAddress: optionOf(danteBackupDTO.thumbnailAddress),
      rating: danteBackupDTO.rating,
      summary: optionOf(danteBackupDTO.summary),
      tags: _fromDanteToRestoredBookTags(danteBackupDTO.labels),
      startDate: _toDateTime(danteBackupDTO.startDate),
      endDate: _toDateTime(danteBackupDTO.endDate),
    );

RestoredBookState _fromDanteToRestoredBookState(RestoredBookStateDTO state) {
  switch (state) {
    case RestoredBookStateDTO.forLater:
      return RestoredBookState.readLater;
    case RestoredBookStateDTO.reading:
      return RestoredBookState.reading;
    case RestoredBookStateDTO.read:
      return RestoredBookState.read;
  }
}

Set<RestoredTag> _fromDanteToRestoredBookTags(Set<LabelDTO> labels) {
  return labels.map(_toRestoredTag).toSet();
}

RestoredTag _toRestoredTag(LabelDTO label) {
  return RestoredTag(
    title: label.title,
    hexColor: label.color,
  );
}

Option<DateTime> _toDateTime(int millisSinceEpoch) {
  return millisSinceEpoch == 0
      ? none()
      : some(DateTime.fromMillisecondsSinceEpoch(millisSinceEpoch));
}

List<LocalBackupBookDTO> toLocalBackupBookDTOs(List<LocalBook> books) {
  return books.map(_toLocalBackupBookDTO).toList();
}

LocalBackupBookDTO _toLocalBackupBookDTO(LocalBook book) {
  return LocalBackupBookDTO(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    state: _toLocalBackupBookStateDTO(book.state),
    pageCount: book.pageCount,
    isbn: book.isbn,
    thumbnailAddress: book.thumbnailAddress,
    rating: book.rating,
    summary: book.summary,
    tags: _toLocalBackupTagDTOs(book.tags),
    startDate: book.startDate,
    endDate: book.endDate,
  );
}

LocalBackupBookStateDTO _toLocalBackupBookStateDTO(LocalBookState state) {
  switch (state) {
    case LocalBookState.readLater:
      return LocalBackupBookStateDTO.readLater;
    case LocalBookState.reading:
      return LocalBackupBookStateDTO.reading;
    case LocalBookState.read:
      return LocalBackupBookStateDTO.read;
  }
}

Set<LocalBackupTagDTO> _toLocalBackupTagDTOs(Set<Tag> tags) {
  return tags.map((tag) {
    return LocalBackupTagDTO(
      name: tag.name,
      hexColor: tag.hexColor,
    );
  }).toSet();
}

List<RestoredBook> toRestoredBooks(List<LocalBackupBookDTO> books) {
  return books.map(_toRestoredBook).toList();
}

RestoredBook _toRestoredBook(LocalBackupBookDTO book) => RestoredBook(
      title: book.title,
      subtitle: book.subtitle,
      authors: book.authors,
      state: _toRestoredBookState(book.state),
      pageCount: book.pageCount,
      isbn: book.isbn,
      thumbnailAddress: book.thumbnailAddress,
      rating: book.rating,
      summary: book.summary,
      tags: _toRestoredBookTags(book.tags),
      startDate: book.startDate,
      endDate: book.endDate,
    );

RestoredBookState _toRestoredBookState(LocalBackupBookStateDTO state) {
  switch (state) {
    case LocalBackupBookStateDTO.readLater:
      return RestoredBookState.readLater;
    case LocalBackupBookStateDTO.reading:
      return RestoredBookState.reading;
    case LocalBackupBookStateDTO.read:
      return RestoredBookState.read;
  }
}

Set<RestoredTag> _toRestoredBookTags(Set<LocalBackupTagDTO> tags) {
  return tags.map((tag) {
    return RestoredTag(
      title: tag.name,
      hexColor: tag.hexColor,
    );
  }).toSet();
}
