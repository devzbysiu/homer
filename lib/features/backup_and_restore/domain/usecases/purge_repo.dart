import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/repositories/books_repository.dart';

typedef PurgeRepo = UseCase<Unit, NoParams>;

final class PurgeRepoImpl implements PurgeRepo {
  PurgeRepoImpl(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(NoParams params) async {
    return booksRepo.deleteAll();
  }
}
