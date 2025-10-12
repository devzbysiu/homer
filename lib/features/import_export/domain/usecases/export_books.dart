import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/repositories/books_repository.dart';
import '../repositories/import_export_repository.dart';

typedef ExportBooks = UseCase<Unit, ExportParams>;

final class ExportBooksImpl implements ExportBooks {
  ExportBooksImpl(this.importExportRepo, this.booksRepo);

  final ImportExportRepository importExportRepo;

  final BooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(ExportParams params) async {
    final listResult = await booksRepo.listAll();
    return listResult.when(
      (books) => importExportRepo.saveAll(params.path, books),
      (error) => Error(error),
    );
  }
}

final class ExportParams extends Equatable {
  const ExportParams({required this.path});

  final String path;

  @override
  List<Object> get props => [path];
}
