import 'dart:collection';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../../core/entities/book.dart';
import 'month_info.dart';

typedef BookCounts = int;

const int _defaultLimit = 13;

final class BooksPerMonthData extends Equatable {
  BooksPerMonthData(Map<MonthInfo, BookCounts> booksPerMonth)
      : _booksPerMonth = SplayTreeMap.from(booksPerMonth);

  BooksPerMonthData.empty() : _booksPerMonth = SplayTreeMap.from({});

  final SplayTreeMap<MonthInfo, BookCounts> _booksPerMonth;

  BooksPerMonthData add(Book book) {
    final year = book.endDate.toNullable()!.year;
    final month = book.endDate.toNullable()!.month;
    final monthInfo = MonthInfo(year, month);
    final newBookCounts = (_booksPerMonth[monthInfo] ?? 0) + 1;
    final Map<MonthInfo, BookCounts> newBooksPerMonth =
        SplayTreeMap.from(_booksPerMonth);
    newBooksPerMonth[monthInfo] = newBookCounts;
    return BooksPerMonthData(newBooksPerMonth);
  }

  BooksPerMonthData remove(Book book) {
    final year = book.endDate.toNullable()!.year;
    final month = book.endDate.toNullable()!.month;
    final monthInfo = MonthInfo(year, month);
    // can use `!` because we know that the book is finished so it's already in the map
    final newBookCounts = _booksPerMonth[monthInfo]! - 1;
    final Map<MonthInfo, BookCounts> newBooksPerMonth =
        SplayTreeMap.from(_booksPerMonth);
    newBooksPerMonth[monthInfo] = newBookCounts;
    return BooksPerMonthData(newBooksPerMonth);
  }

  List<MonthInfo> months({Option<MonthInfo> last = const None()}) {
    return _generateLatestMonthInfos(last);
  }

  List<MonthInfo> _generateLatestMonthInfos(Option<MonthInfo> lastMonth) {
    final last = lastMonth.getOrElse(() => MonthInfo.current());
    final result = <MonthInfo>[];
    var currentMonthInfo = last - _defaultLimit;
    while (currentMonthInfo.compareTo(last) <= 0) {
      result.add(currentMonthInfo);
      currentMonthInfo = currentMonthInfo.next();
    }
    return result;
  }

  List<BookCounts> bookCounts({Option<MonthInfo> last = const None()}) {
    return _generateLatestMonthInfos(last)
        .map((monthInfo) => _booksPerMonth[monthInfo] ?? 0)
        .toList();
  }

  @override
  List<Object> get props => [_booksPerMonth];
}
