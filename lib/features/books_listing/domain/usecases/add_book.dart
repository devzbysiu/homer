import 'package:event_bus/event_bus.dart';
import 'package:homer/core/error/failure.dart';
import 'package:homer/core/usecase/usecase.dart';
import 'package:homer/features/books_listing/domain/repositories/books_repository.dart';
import 'package:multiple_result/multiple_result.dart';
import 'package:multiple_result/src/result.dart';

import '../entities/book.dart';

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