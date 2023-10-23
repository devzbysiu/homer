import 'package:homer/core/utils/books_sort.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../book_summary/domain/entities/local_book.dart';
import '../repositories/local_books_repository.dart';

final class FilterBooks extends UseCase<List<LocalBook>, FilterParams> {
  FilterBooks(this.booksRepo);

  final LocalBooksRepository booksRepo;

  @override
  Future<Result<List<LocalBook>, Failure>> call(FilterParams params) async {
    final listResult = await booksRepo.listAll();
    return listResult.when(
      (books) => Success(_filter(books, params.query)),
      (error) => Error(error),
    );
  }

  List<LocalBook> _filter(List<LocalBook> books, String query) {
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
