import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../books_listing/domain/repositories/local_books_repository.dart';
import '../../data/mappers/restored_book_mapper.dart';
import '../entities/restored_book.dart';
import '../repositories/backup_repository.dart';

final class LoadFromLocalBackup
    extends UseCase<List<RestoredBook>, RestoreParams> {
  LoadFromLocalBackup(this.backupRepo, this.booksRepo, this.bookMapper);

  final BackupRepository backupRepo;

  final LocalBooksRepository booksRepo;

  final RestoredBookMapper bookMapper;

  @override
  Future<Result<List<RestoredBook>, Failure>> call(RestoreParams params) async {
    return backupRepo.loadAll(params.path);
  }
}

final class RestoreParams {
  const RestoreParams({required this.path});

  final String path;
}
