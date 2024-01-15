import 'dart:collection';

import 'package:collection/collection.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/repositories/books_repository.dart';
import '../entities/books_per_year.dart';

typedef LoadBooksPerYear = UseCase<BooksPerYear, NoParams>;

final class LoadBooksPerYearImpl implements LoadBooksPerYear {
  LoadBooksPerYearImpl(this.repo);

  final BooksRepository repo;

  @override
  Future<Result<BooksPerYear, Failure>> call(NoParams params) async {
    final result = await repo.listAll();
    if (result.isError()) return Error(result.tryGetError()!);
    final books = result.tryGetSuccess()!;
    final years = _groupByFinishedYear(books);
    final bookCounts = years.map((year, books) => MapEntry(year, books.length));
    return Success(BooksPerYear(SplayTreeMap.from(bookCounts)));
  }

  Map<int, List<Book>> _groupByFinishedYear(List<Book> books) {
    final finishedBooks = books.where((book) => book.endDate.isSome());
    return groupBy(finishedBooks, (b) => b.endDate.toNullable()!.year);
  }
}
