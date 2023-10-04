import 'package:multiple_result/src/result.dart';

import '../../../../core/error/failure.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../books_listing/domain/entities/book_entity.dart';
import '../../../books_listing/domain/repositories/books_repository.dart';

final class SearchBooks extends UseCase<List<BookEntity>, SearchParams> {
  SearchBooks(this.booksRepo);

  @override
  Future<Result<List<BookEntity>, Failure>> call(SearchParams params) async {
    return await booksRepo.search(params.query);
  }

  final BooksRepository booksRepo;
}

final class SearchParams {
  SearchParams({required this.query});

  final String query;
}
