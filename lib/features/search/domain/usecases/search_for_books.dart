import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/remote_book.dart';
import '../repositories/remote_books_repository.dart';

final class SearchForBooks extends UseCase<List<RemoteBook>, SearchParams> {
  SearchForBooks(this.booksRepo);

  final RemoteBooksRepository booksRepo;

  @override
  Future<Result<List<RemoteBook>, Failure>> call(SearchParams params) async {
    return await booksRepo.search(params.query);
  }
}

final class SearchParams {
  SearchParams({required this.query});

  final String query;
}
