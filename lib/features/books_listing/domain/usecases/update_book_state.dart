import 'package:homer/core/error/failure.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/books_listing/domain/entities/book_entity.dart';
import 'package:homer/features/books_listing/domain/repositories/books_repository.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multiple_result/src/result.dart';

final class UpdateBookState extends UseCase<Unit, UpdateParams> {
  UpdateBookState(this.booksRepo);

  @override
  Future<Result<Unit, Failure>> call(UpdateParams params) async {
    return await booksRepo.swap(params.book, params.withCopy);
  }

  final BooksRepository booksRepo;
}



final class UpdateParams {
  UpdateParams({required this.book, required this.withCopy});

  final BookEntity book;

  final BookEntity withCopy;
}