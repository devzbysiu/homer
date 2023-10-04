import 'package:homer/core/error/failure.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/books_listing/domain/repositories/books_repository.dart';
import 'package:multiple_result/src/result.dart';

import '../entities/book_entity.dart';

final class ListBooks extends UseCase<List<BookEntity>, NoParams> {
  ListBooks(this.booksRepo);

  @override
  Future<Result<List<BookEntity>, Failure>> call(NoParams params) async {
    return await booksRepo.listAll();
  }

  final BooksRepository booksRepo;
}

final class NoParams {}