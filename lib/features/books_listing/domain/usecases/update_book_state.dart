import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/book.dart';
import '../repositories/books_repository.dart';

final class UpdateBookState extends UseCase<Unit, UpdateParams> {
  UpdateBookState(this.booksRepo);

  @override
  Future<Result<Unit, Failure>> call(UpdateParams params) async {
    return await booksRepo.swap(params.book, params.withCopy);
  }

  final BooksRepository booksRepo;
}

final class UpdateParams {
  UpdateParams({required this.book, required this.withCopy});

  final Book book;

  final Book withCopy;
}
