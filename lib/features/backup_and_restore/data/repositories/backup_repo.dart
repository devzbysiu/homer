import 'dart:io';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../domain/repositories/backup_repository.dart';
import '../datasources/backup_data_source.dart';
import '../mappers/to_backup_book_dtos.dart';
import '../mappers/to_books.dart';

final class BackupRepo implements BackupRepository {
  BackupRepo({required this.dataSource});

  final BackupDataSource dataSource;

  @override
  Future<Result<List<Book>, Failure>> loadAll(String path) async {
    try {
      final backupBookDTO = await dataSource.loadAll(path);
      final books = toBooks(backupBookDTO);
      return Success(books);
    } on FileSystemException catch (e) {
      return Error(MissingBackupFileFailure(path, e.message));
    }
  }

  @override
  Future<Result<Unit, Failure>> saveAll(
    String path,
    List<Book> books,
  ) async {
    try {
      final backupBookDTOs = toBackupBookDTOs(books);
      await dataSource.saveAll(path, backupBookDTOs);
      return const Success(unit);
    } on FileSystemException catch (e) {
      return Error(MissingBackupFileFailure(path, e.message));
    }
  }
}
