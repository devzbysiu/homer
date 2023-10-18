import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/local_book.dart';
import '../repositories/local_books_repository.dart';

final class UpdateBook extends UseCase<Unit, UpdateParams> {
  UpdateBook(this.booksRepo);

  final LocalBooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(UpdateParams params) async {
    return await booksRepo.update(params.modified);
  }
}

final class UpdateParams {
  UpdateParams({required this.modified});

  final LocalBook modified;
}
