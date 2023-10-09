import 'package:homer/core/error/failures.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/books_listing/domain/repositories/local_books_repository.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../books_listing/domain/entities/local_book.dart';

final class DeletePickedBooks implements UseCase<Unit, DeleteParams> {
  DeletePickedBooks(this.booksRepo);

  final LocalBooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(DeleteParams params) async {
    await booksRepo.delete(params.books);
    return Future.value(const Success(unit));
  }
}

final class DeleteParams {
  DeleteParams({required this.books});

  final List<LocalBook> books;
}
