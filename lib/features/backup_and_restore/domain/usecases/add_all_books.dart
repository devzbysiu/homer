import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/entities/book.dart';
import '../../../manage_books/domain/repositories/books_repository.dart';

final class AddAllBooks extends UseCase<Unit, AddAllParams> {
  AddAllBooks(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(AddAllParams params) async {
    await booksRepo.addAll(params.books);
    return Future.value(const Success(unit));
  }
}

final class AddAllParams {
  AddAllParams({required this.books});

  final List<Book> books;
}
