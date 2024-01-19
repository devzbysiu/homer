import 'package:collection/collection.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/repositories/books_repository.dart';
import '../entities/books_per_month_data.dart';
import '../entities/month_info.dart';

typedef LoadBooksPerMonth = UseCase<BooksPerMonthData, NoParams>;

final class LoadBooksPerMonthImpl implements LoadBooksPerMonth {
  LoadBooksPerMonthImpl(this.repo);

  final BooksRepository repo;

  @override
  Future<Result<BooksPerMonthData, Failure>> call(NoParams params) async {
    final result = await repo.listAll();
    if (result.isError()) return Error(result.tryGetError()!);
    final books = result.tryGetSuccess()!;
    final years = _groupByFinishedMonthInfo(books);
    final bookCounts = years.map((year, books) => MapEntry(year, books.length));
    return Success(BooksPerMonthData(bookCounts));
  }

  Map<MonthInfo, List<Book>> _groupByFinishedMonthInfo(List<Book> books) {
    final finishedBooks = books.where((book) => book.endDate.isSome());
    return groupBy(finishedBooks, (b) {
      final endDate = b.endDate.toNullable()!;
      return MonthInfo(endDate.year, endDate.month);
    });
  }
}
