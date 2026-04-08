import 'dart:collection';

import 'package:equatable/equatable.dart';

import '../../../../core/entities/book.dart';

typedef Year = int;

typedef BookCounts = int;

final class BooksPerYearData extends Equatable {
  BooksPerYearData(Map<Year, BookCounts> booksPerYear)
    : _booksPerYear = SplayTreeMap.from(booksPerYear);

  BooksPerYearData.empty() : _booksPerYear = SplayTreeMap.from({});

  final SplayTreeMap<Year, BookCounts> _booksPerYear;

  BooksPerYearData add(Book book) {
    final year = book.endDate.toNullable()!.year;
    final newBookCounts = (_booksPerYear[year] ?? 0) + 1;
    final Map<Year, BookCounts> newBooksPerYear = SplayTreeMap.from(
      _booksPerYear,
    );
    newBooksPerYear[year] = newBookCounts;
    return BooksPerYearData(newBooksPerYear);
  }

  BooksPerYearData remove(Book book) {
    final year = book.endDate.toNullable()!.year;
    // can use `!` because we know that the book is finished so it's already in the map
    final newBookCounts = _booksPerYear[year]! - 1;
    final Map<Year, BookCounts> newBooksPerYear = SplayTreeMap.from(
      _booksPerYear,
    );
    newBooksPerYear[year] = newBookCounts;
    return BooksPerYearData(newBooksPerYear);
  }

  List<Year> get years => _booksPerYear.keys.toList();

  List<BookCounts> get bookCounts => _booksPerYear.values.toList();

  @override
  List<Object> get props => [_booksPerYear];
}
