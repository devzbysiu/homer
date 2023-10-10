import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../domain/entities/restored_book.dart';
import '../../domain/repositories/backup_repository.dart';
import '../datasources/backup_data_source.dart';
import '../mappers/restored_book_mapper.dart';

final class LocalBackupRepo implements BackupRepository {
  LocalBackupRepo({
    required this.localBackupDataSource,
    required this.bookMapper,
  });

  final LocalBackupDataSource localBackupDataSource;

  final RestoredBookMapper bookMapper;

  @override
  Future<Result<List<RestoredBook>, Failure>> loadAll(String path) async {
    final restoredBookDTOs = await localBackupDataSource.loadAll(path);
    final books = bookMapper.toRestoredBook(restoredBookDTOs);
    return Future.value(Success(books));
  }
}
