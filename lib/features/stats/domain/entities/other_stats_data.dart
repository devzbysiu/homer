import 'package:equatable/equatable.dart';

import '../../../../core/entities/book.dart';
import 'month_info.dart';
import 'most_read_info.dart';

final class OtherStatsData extends Equatable {
  const OtherStatsData(Map<MonthInfo, int> readByMonth)
    : _readByMonth = readByMonth;

  OtherStatsData.empty() : _readByMonth = {};

  final Map<MonthInfo, int> _readByMonth;

  OtherStatsData add(Book book) {
    assert(book.endDate.isSome());
    final endDate = book.endDate.toNullable()!;
    final Map<MonthInfo, int> readByMonth = Map.from(_readByMonth);
    readByMonth.update(
      MonthInfo(endDate.year, endDate.month),
      (value) => value + 1,
      ifAbsent: () => 1,
    );
    return OtherStatsData(readByMonth);
  }

  OtherStatsData remove(Book book) {
    assert(book.endDate.isSome());
    final endDate = book.endDate.toNullable()!;
    final Map<MonthInfo, int> readByMonth = Map.from(_readByMonth);
    readByMonth.update(
      MonthInfo(endDate.year, endDate.month),
      (value) => value - 1,
      ifAbsent: () => 0,
    );
    return OtherStatsData(readByMonth);
  }

  double get average {
    final totalMonths = _readByMonth.length;
    final totalBooks = _readByMonth.values.reduce((a, b) => a + b);
    return totalBooks / totalMonths;
  }

  MostReadInfo get mostRead {
    final maxEntry = _readByMonth.entries.reduce((currentMaxEntry, nextEntry) {
      return nextEntry.value > currentMaxEntry.value
          ? nextEntry
          : currentMaxEntry;
    });
    return MostReadInfo(maxEntry.key, maxEntry.value);
  }

  @override
  List<Object> get props => [_readByMonth];
}
