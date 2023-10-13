// TODO: This file should be deleted after successful move from dante
import 'package:dartz/dartz.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/restored_book.dart';
import '../../domain/repositories/backup_repository.dart';
import '../datasources/backup_data_source.dart';
import '../models/restored_book_dto.dart';

final class DanteBackupRepo implements BackupRepository {
  DanteBackupRepo({required this.localBackupDataSource});

  final LocalBackupDataSource localBackupDataSource;

  @override
  Future<Result<List<RestoredBook>, Failure>> loadAll(String path) async {
    final restoredBookDTOs = await localBackupDataSource.loadAll(path);
    final restoredBooks = toRestoredBooks(restoredBookDTOs);
    return Future.value(Success(restoredBooks));
  }
}

List<RestoredBook> toRestoredBooks(List<RestoredBookDTO> restoredBookDTOs) {
  return restoredBookDTOs.map(_toRestoredBook).toList();
}

RestoredBook _toRestoredBook(RestoredBookDTO restoredBookDTO) => RestoredBook(
      title: restoredBookDTO.title,
      subtitle: restoredBookDTO.subTitle,
      authors: [restoredBookDTO.author],
      state: _toRestoredBookState(restoredBookDTO.state),
      pageCount: restoredBookDTO.pageCount,
      isbn: restoredBookDTO.isbn,
      thumbnailAddress: optionOf(restoredBookDTO.thumbnailAddress),
      rating: restoredBookDTO.rating,
      summary: restoredBookDTO.summary,
      tags: _toRestoredBookTags(restoredBookDTO.labels),
      dateModified: _toDateTime(restoredBookDTO.endDate),
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

// TODO: Remove stuff related to dante backup
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
