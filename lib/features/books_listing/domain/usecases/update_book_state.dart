import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/book.dart';
import '../repositories/books_repository.dart';

final class UpdateBookState extends UseCase<Unit, UpdateParams> {
  UpdateBookState(this.booksRepo);

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
