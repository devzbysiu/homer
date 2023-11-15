import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/books_repository.dart';

final class UpdateBook extends UseCase<Unit, UpdateParams> {
  UpdateBook(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(UpdateParams params) async {
    return await booksRepo.update(params.modified);
  }
}

final class UpdateParams {
  UpdateParams({required this.modified});

  final Book modified;
}
