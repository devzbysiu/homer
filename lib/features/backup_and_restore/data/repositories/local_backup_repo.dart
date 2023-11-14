import 'dart:io';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../manage_books/domain/entities/local_book.dart';
import '../../domain/repositories/backup_repository.dart';
import '../datasources/local_backup_data_source.dart';
import '../mappers/to_local_backup_book_dtos.dart';
import '../mappers/to_local_books.dart';

final class LocalBackupRepo implements BackupRepository {
  LocalBackupRepo({required this.dataSource});

  final LocalBackupDataSource dataSource;

  @override
  Future<Result<List<LocalBook>, Failure>> loadAll(String path) async {
    try {
      final localBackupBookDTO = await dataSource.loadAll(path);
      final localBooks = toLocalBooks(localBackupBookDTO);
      return Future.value(Success(localBooks));
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
