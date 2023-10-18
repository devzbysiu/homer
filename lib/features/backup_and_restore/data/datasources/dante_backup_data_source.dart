// TODO: This file should be removed after successful move from dante
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';

import '../../../books_listing/data/models/local_book_dto.dart';
import '../../domain/entities/restored_book.dart';
import '../models/dante_backup_dto.dart';

abstract class LocalBackupDataSource {
  Future<List<DanteBackupDTO>> loadAll(String path);

  Future<Unit> saveAll(String path, List<LocalBookDTO> books);
}

final class DanteBackupDataSource implements LocalBackupDataSource {
  @override
  Future<List<DanteBackupDTO>> loadAll(String path) async {
    final backupFile = File(path);
    final backupContent = await backupFile.readAsString();
    final json = jsonDecode(backupContent);
    final jsonBooks = json['books'] as List;
    final restoredBookDTOs =
        jsonBooks.map((jsonBook) => DanteBackupDTO.fromJson(jsonBook)).toList();
    return Future.value(restoredBookDTOs);
  }

  @override
  Future<Unit> saveAll(String path, List<LocalBookDTO> books) {
    print('saving backup......');
    return Future.value(unit);
  }
}

List<RestoredBook> toRestoredBooks(List<DanteBackupDTO> danteBackupDTOs) {
  final restoredBooks = danteBackupDTOs.map(_toRestoredBook).toList();
  for (var book in restoredBooks) {
    book.tags.removeWhere((tag) => tag.title.contains('size:'));
    if (book.tags.where((tag) => tag.title == 'type:technical').isNotEmpty) {
      book.tags.removeWhere((tag) => tag.title == 'type:technical');
      book.tags.add(
        RestoredTag(
          title: 'technical',
          color: RestoredTagColor.brown,
        ),
      );
    }
  }
  return restoredBooks;
}

RestoredBook _toRestoredBook(DanteBackupDTO danteBackupDTO) => RestoredBook(
      title: danteBackupDTO.title,
      subtitle: danteBackupDTO.subTitle,
      authors: [danteBackupDTO.author],
      state: _toRestoredBookState(danteBackupDTO.state),
      pageCount: danteBackupDTO.pageCount,
      isbn: danteBackupDTO.isbn,
      thumbnailAddress: optionOf(danteBackupDTO.thumbnailAddress),
      rating: danteBackupDTO.rating,
      summary: danteBackupDTO.summary,
      tags: _toRestoredBookTags(danteBackupDTO.labels),
      dateModified: _toDateTime(danteBackupDTO.endDate),
    );

RestoredBookState _toRestoredBookState(RestoredBookStateDTO state) {
  switch (state) {
    case RestoredBookStateDTO.forLater:
      return RestoredBookState.readLater;
    case RestoredBookStateDTO.reading:
      return RestoredBookState.reading;
    case RestoredBookStateDTO.read:
      return RestoredBookState.read;
  }
}

Set<RestoredTag> _toRestoredBookTags(Set<LabelDTO> labels) {
  return labels.map(_toRestoredTag).toSet();
}

RestoredTag _toRestoredTag(LabelDTO label) {
  return RestoredTag(
    title: label.title,
    color: _toRestoredTagColor(label.color),
  );
}

RestoredTagColor _toRestoredTagColor(String color) {
  switch (color) {
    case '#ff4caf50':
      return RestoredTagColor.green;
    case '#ff03a9f4':
      return RestoredTagColor.blue;
    case '#ffff9800':
      return RestoredTagColor.orange;
    case '#ff9f6459':
      return RestoredTagColor.brown;
    default:
      throw Exception('Invalid color: $color');
  }
}

DateTime _toDateTime(int endDate) {
  return endDate == 0
      ? DateTime.now()
      : DateTime.fromMicrosecondsSinceEpoch(endDate);
}
