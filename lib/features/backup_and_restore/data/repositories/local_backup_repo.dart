import 'dart:io';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/mappers/local_books_mapper.dart';
import '../../../../core/mappers/restored_books_mapper.dart';
import '../../../manage_books/domain/entities/local_book.dart';
import '../../domain/entities/restored_book.dart';
import '../../domain/repositories/backup_repository.dart';
import '../datasources/dante_backup_data_source.dart';

final class LocalBackupRepo implements BackupRepository {
  LocalBackupRepo({required this.dataSource});

  final LocalBackupDataSource dataSource;

  @override
  Future<Result<List<RestoredBook>, Failure>> loadAll(String path) async {
    try {
      final localBackupBookDTO = await dataSource.loadAll(path);
      final restoredBooks = toRestoredBooks(localBackupBookDTO);
      return Future.value(Success(restoredBooks));
    } on FileSystemException {
      return Future.value(Error(MissingBackupFileFailure(path)));
    }
  }

  @override
  Future<Result<Unit, Failure>> saveAll(
    String path,
    List<LocalBook> books,
  ) async {
    try {
      final localBackupBookDTOs = toLocalBackupBookDTOs(books);
      await dataSource.saveAll(path, localBackupBookDTOs);
      return Future.value(const Success(unit));
    } on FileSystemException {
      return Future.value(Error(MissingBackupFileFailure(path)));
    }
  }
}
