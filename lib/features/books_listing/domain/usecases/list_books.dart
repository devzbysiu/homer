import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/local_book.dart';
import '../repositories/local_books_repository.dart';

final class ListBooks extends UseCase<List<LocalBook>, NoParams> {
  ListBooks(this.booksRepo);

  final LocalBooksRepository booksRepo;

  @override
  Future<Result<List<LocalBook>, Failure>> call(NoParams params) async {
    final listResult = await booksRepo.listAll();
    return listResult.when(
      (books) => Success(_sort(books)),
      (error) => Error(error),
    );
  }

  List<LocalBook> _sort(List<LocalBook> books) {
    books.sort((a, b) => b.dateModified.compareTo(a.dateModified));
    return books;
  }
}
