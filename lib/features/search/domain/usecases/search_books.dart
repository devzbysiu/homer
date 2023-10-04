import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../books_listing/domain/entities/book.dart';
import '../../../books_listing/domain/repositories/books_repository.dart';

final class SearchBooks extends UseCase<List<Book>, SearchParams> {
  SearchBooks(this.booksRepo);

  @override
  Future<Result<List<Book>, Failure>> call(SearchParams params) async {
    return await booksRepo.search(params.query);
  }

  final BooksRepository booksRepo;
}

final class SearchParams {
  SearchParams({required this.query});

  final String query;
}
