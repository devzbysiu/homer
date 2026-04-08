import 'package:collection/collection.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/repositories/books_repository.dart';
import '../entities/month_info.dart';
import '../entities/other_stats_data.dart';

typedef LoadOtherStats = UseCase<OtherStatsData, NoParams>;

final class LoadOtherStatsImpl implements LoadOtherStats {
  LoadOtherStatsImpl(this.repo);

  final BooksRepository repo;

  @override
  Future<Result<OtherStatsData, Failure>> call(NoParams params) async {
    final result = await repo.listAll();
    if (result.isError()) return Error(result.tryGetError()!);
    final books = result.tryGetSuccess()!;
    final finishedBooks = books.where((book) => book.endDate.isSome()).toList();
    final readByMonth = _readByMonth(finishedBooks);
    return Success(OtherStatsData(readByMonth));
  }

  Map<MonthInfo, int> _readByMonth(List<Book> finishedBooks) {
    return groupBy(finishedBooks, (b) {
      final endDate = b.endDate.toNullable()!;
      return MonthInfo(endDate.year, endDate.month);
    }).map((monthInfo, books) => MapEntry(monthInfo, books.length));
  }
}
