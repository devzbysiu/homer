import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../book_summary/domain/entities/local_book.dart';
import '../../domain/entities/restored_book.dart';
import '../../domain/repositories/backup_repository.dart';
import '../datasources/dante_backup_data_source.dart';

final class LocalBackupRepo implements BackupRepository {
  LocalBackupRepo({required this.localBackupDataSource});

  final LocalBackupDataSource localBackupDataSource;

  @override
  Future<Result<List<RestoredBook>, Failure>> loadAll(String path) async {
    final localBackupBookDTO = await localBackupDataSource.loadAll(path);
    final restoredBooks = toRestoredBooks(localBackupBookDTO);
    return Future.value(Success(restoredBooks));
  }

  @override
  Future<Result<Unit, Failure>> saveAll(
    String path,
    List<LocalBook> books,
  ) async {
    final localBackupBookDTOs = toLocalBackupBookDTOs(books);
    await localBackupDataSource.saveAll(path, localBackupBookDTOs);
    return Future.value(const Success(unit));
  }
}
