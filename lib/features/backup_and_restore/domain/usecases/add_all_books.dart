import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/entities/local_book.dart';
import '../../../manage_books/domain/repositories/local_books_repository.dart';

final class AddAllBooks extends UseCase<Unit, AddAllParams> {
  AddAllBooks(this.booksRepo);

  final LocalBooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(AddAllParams params) async {
    await booksRepo.addAll(params.books);
    return Future.value(const Success(unit));
  }
}

final class AddAllParams {
  AddAllParams({required this.books});

  final List<LocalBook> books;
}
