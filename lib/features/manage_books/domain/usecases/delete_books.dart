import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/book.dart';
import '../repositories/books_repository.dart';

final class DeleteBooks implements UseCase<Unit, DeleteParams> {
  DeleteBooks(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(DeleteParams params) async {
    await booksRepo.delete(params.books);
    return Future.value(const Success(unit));
  }
}

final class DeleteParams {
  DeleteParams({required this.books});

  final List<Book> books;
}
