import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../book/domain/entities/local_book.dart';
import '../repositories/local_books_repository.dart';

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
