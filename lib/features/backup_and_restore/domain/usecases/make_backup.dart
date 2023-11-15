import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/repositories/books_repository.dart';
import '../repositories/backup_repository.dart';

final class MakeBackup extends UseCase<Unit, BackupParams> {
  MakeBackup(this.backupRepo, this.booksRepo);

  final BackupRepository backupRepo;

  final BooksRepository booksRepo;

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
