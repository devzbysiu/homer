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
    return await booksRepo.listAll();
  }
}
