import 'dart:io';

import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../logger.dart';
import '../../domain/repositories/import_export_repository.dart';
import '../datasources/import_export_data_source.dart';
import '../mappers/to_exported_book_dtos.dart';
import '../mappers/to_books.dart';

final class ImportExportRepo implements ImportExportRepository {
  ImportExportRepo({required this.dataSource});

  final ImportExportDataSource dataSource;

  @override
  Future<Result<List<Book>, Failure>> loadAll(String path) async {
    try {
      final exportedBookDTO = await dataSource.loadAll(path);
      final books = toBooks(exportedBookDTO);
      return Success(books);
    } on FileSystemException catch (e, st) {
      log.handle(e, st, 'Failed to load data from path "$path"');
      return Error(MissingImportFileFailure(path, e.message));
    }
  }

  @override
  Future<Result<Unit, Failure>> saveAll(String path, List<Book> books) async {
    try {
      final exportedBookDTOs = toExportedBookDTOs(books);
      await dataSource.saveAll(path, exportedBookDTOs);
      return const Success(unit);
    } on FileSystemException catch (e, st) {
      log.handle(e, st, 'Failed to save books under path "$path"');
      return Error(MissingImportFileFailure(path, e.message));
    }
  }
}
