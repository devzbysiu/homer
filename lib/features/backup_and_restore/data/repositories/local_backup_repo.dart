import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/mappers/restored_books_mapper.dart';
import '../../domain/entities/restored_book.dart';
import '../../domain/repositories/backup_repository.dart';
import '../datasources/backup_data_source.dart';

final class LocalBackupRepo implements BackupRepository {
  LocalBackupRepo({required this.localBackupDataSource});

  final LocalBackupDataSource localBackupDataSource;

  @override
  Future<Result<List<RestoredBook>, Failure>> loadAll(String path) async {
    final restoredBookDTOs = await localBackupDataSource.loadAll(path);
    final restoredBooks = toRestoredBook(restoredBookDTOs);
    return Future.value(Success(restoredBooks));
  }
}
