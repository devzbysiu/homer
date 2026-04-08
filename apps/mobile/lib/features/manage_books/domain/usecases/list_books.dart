import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/books_sort.dart';
import '../repositories/books_repository.dart';

typedef ListSortedBooks = UseCase<List<Book>, NoParams>;

final class ListSortedBooksImpl implements ListSortedBooks {
  ListSortedBooksImpl(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<List<Book>, Failure>> call(NoParams params) async {
    final listResult = await booksRepo.listAll();
    return listResult.when(
      (books) => Success(sortByStateAndDate(books)),
      (error) => Error(error),
    );
  }
}
