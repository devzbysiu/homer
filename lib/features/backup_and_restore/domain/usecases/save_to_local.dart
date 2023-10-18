import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../books_listing/domain/repositories/local_books_repository.dart';
import '../repositories/backup_repository.dart';

final class SaveToLocalBackup extends UseCase<Unit, BackupParams> {
  SaveToLocalBackup(this.backupRepo, this.booksRepo);

  final BackupRepository backupRepo;

  final LocalBooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(BackupParams params) async {
    final listResult = await booksRepo.listAll();
    return listResult.when(
      (books) => backupRepo.saveAll(params.path, books),
      (error) => Error(error),
    );
  }
}

final class BackupParams {
  const BackupParams({required this.path});

  final String path;
}
