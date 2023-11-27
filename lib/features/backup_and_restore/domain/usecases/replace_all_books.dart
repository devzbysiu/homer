import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/repositories/books_repository.dart';

typedef ReplaceAllBooks = UseCase<Unit, ReplaceAllParams>;

final class ReplaceAllBooksImpl implements ReplaceAllBooks {
  ReplaceAllBooksImpl(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(ReplaceAllParams params) async {
    return booksRepo.replaceAll(params.books);
  }
}

final class ReplaceAllParams {
  ReplaceAllParams({required this.books});

  final List<Book> books;
}
