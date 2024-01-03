import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/books_repository.dart';

typedef DeleteBooks = UseCase<Unit, DeleteParams>;

final class DeleteBooksImpl implements DeleteBooks {
  DeleteBooksImpl(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(DeleteParams params) async {
    return await booksRepo.delete(params.books);
  }
}

final class DeleteParams {
  DeleteParams({required this.books});

  final List<Book> books;
}
