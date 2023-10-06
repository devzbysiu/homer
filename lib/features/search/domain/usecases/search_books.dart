import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../books_listing/domain/entities/book.dart';
import '../../../books_listing/domain/repositories/books_repository.dart';

final class SearchBooks extends UseCase<List<Book>, SearchParams> {
  SearchBooks(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<List<Book>, Failure>> call(SearchParams params) async {
    return await booksRepo.search(params.query);
  }
}

final class SearchParams {
  SearchParams({required this.query});

  final String query;
}
