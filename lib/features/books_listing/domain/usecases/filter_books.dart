import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../book/domain/entities/local_book.dart';
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
    final filtered = books
        .where((book) => book.title.toLowerCase().contains(query.toLowerCase()))
        .toList();
    filtered.sort((a, b) => b.dateModified.compareTo(a.dateModified));
    return filtered;
  }
}

final class FilterParams {
  FilterParams({required this.query});

  final String query;
}
