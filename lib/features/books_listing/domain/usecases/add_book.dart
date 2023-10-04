import 'package:multiple_result/multiple_result.dart';

import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../entities/book.dart';
import '../repositories/books_repository.dart';

final class AddBook extends UseCase<Unit, AddParams> {
  AddBook(this.booksRepo);

  @override
  Future<Result<Unit, Failure>> call(AddParams params) async {
    return await booksRepo.add(params.book);
  }

  final BooksRepository booksRepo;
}

final class AddParams {
  AddParams({required this.book});

  final Book book;
}
