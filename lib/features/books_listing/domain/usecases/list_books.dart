import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/book.dart';
import '../repositories/books_repository.dart';

final class ListBooks extends UseCase<List<Book>, NoParams> {
  ListBooks(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<List<Book>, Failure>> call(NoParams params) async {
    return await booksRepo.listAll();
  }
}
