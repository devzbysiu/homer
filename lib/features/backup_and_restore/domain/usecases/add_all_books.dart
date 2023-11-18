import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/repositories/books_repository.dart';

final class AddAllBooks extends UseCase<Unit, AddAllParams> {
  AddAllBooks(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(AddAllParams params) async {
    return booksRepo.addAll(params.books);
  }
}

final class AddAllParams {
  AddAllParams({required this.books});

  final List<Book> books;
}
