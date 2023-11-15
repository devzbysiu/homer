import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/books_sort.dart';
import '../repositories/books_repository.dart';

final class FilterBooks extends UseCase<List<Book>, FilterParams> {
  FilterBooks(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<List<Book>, Failure>> call(FilterParams params) async {
    final listResult = await booksRepo.listAll();
    return Future.value(listResult.when(
      (books) => Success(_filter(books, params.query)),
      (error) => Error(error),
    ));
  }

  List<Book> _filter(List<Book> books, String query) {
    final matchingBooks = books
        .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    return sortByStateAndDate(matchingBooks);
  }
}

final class FilterParams {
  FilterParams({required this.query});

  final String query;
}
