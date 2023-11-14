import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/entities/local_book.dart';
import '../repositories/remote_books_repository.dart';

final class SearchForBooks extends UseCase<List<LocalBook>, SearchParams> {
  SearchForBooks(this.booksRepo);

  final RemoteBooksRepository booksRepo;

  @override
  Future<Result<List<LocalBook>, Failure>> call(SearchParams params) async {
    return await booksRepo.search(params.query);
  }
}

final class SearchParams {
  SearchParams({required this.query});

  final String query;
}
