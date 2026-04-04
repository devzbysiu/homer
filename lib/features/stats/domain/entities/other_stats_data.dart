import 'package:collection/collection.dart';
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

  double average(int n) {
    final sorted = _readByMonth.entries.toList()
      ..sort((a, b) => a.key.compareTo(b.key));
    final lastNMonths = sorted.reversed.take(n);
    final totalBooks = lastNMonths.map((entry) => entry.value).sum;
    return totalBooks / n;
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
