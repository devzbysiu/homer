import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/backup_repository.dart';

typedef LoadBackup = UseCase<List<Book>, RestoreParams>;

final class LoadBackupImpl implements LoadBackup {
  LoadBackupImpl(this.backupRepo);

  final BackupRepository backupRepo;

  @override
  Future<Result<List<Book>, Failure>> call(RestoreParams params) async {
    return backupRepo.loadAll(params.path);
  }
}

final class RestoreParams extends Equatable {
  const RestoreParams({required this.path});

  final String path;

  @override
  List<Object> get props => [path];
}
