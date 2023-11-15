import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/books_sort.dart';
import '../entities/book.dart';
import '../repositories/books_repository.dart';

final class ListBooks extends UseCase<List<Book>, NoParams> {
  ListBooks(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<List<Book>, Failure>> call(NoParams params) async {
    final listResult = await booksRepo.listAll();
    return Future.value(listResult.when(
      (books) => Success(sortByStateAndDate(books)),
      (error) => Error(error),
    ));
  }
}
