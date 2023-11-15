import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/entities/book.dart';
import '../repositories/backup_repository.dart';

final class LoadBackup extends UseCase<List<Book>, RestoreParams> {
  LoadBackup(this.backupRepo);

  final BackupRepository backupRepo;

  @override
  Future<Result<List<Book>, Failure>> call(RestoreParams params) async {
    return backupRepo.loadAll(params.path);
  }
}

final class RestoreParams {
  const RestoreParams({required this.path});

  final String path;
}
