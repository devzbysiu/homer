import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/import_export_repository.dart';

typedef ImportBooks = UseCase<List<Book>, ImportParams>;

final class ImportBooksImpl implements ImportBooks {
  ImportBooksImpl(this.importExportRepo);

  final ImportExportRepository importExportRepo;

  @override
  Future<Result<List<Book>, Failure>> call(ImportParams params) async {
    return importExportRepo.loadAll(params.path);
  }
}

final class ImportParams extends Equatable {
  const ImportParams({required this.path});

  final String path;

  @override
  List<Object> get props => [path];
}
