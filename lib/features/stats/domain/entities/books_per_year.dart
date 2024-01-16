import 'dart:collection';

import 'package:equatable/equatable.dart';

import '../../../../core/entities/book.dart';

typedef Year = int;

typedef BookCounts = int;

final class BooksPerYear extends Equatable {
  BooksPerYear(Map<Year, BookCounts> booksPerYear)
      : _booksPerYear = SplayTreeMap.from(booksPerYear);

  BooksPerYear.empty() : _booksPerYear = SplayTreeMap.from({});

  final SplayTreeMap<Year, BookCounts> _booksPerYear;

  BooksPerYear add(Book book) {
    final year = book.endDate.toNullable()!.year;
    final newBookCounts = (_booksPerYear[year] ?? 0) + 1;
    final Map<Year, BookCounts> newBooksPerYear =
        SplayTreeMap.from(_booksPerYear);
    newBooksPerYear[year] = newBookCounts;
    return BooksPerYear(newBooksPerYear);
  }

  BooksPerYear remove(Book book) {
    final year = book.endDate.toNullable()!.year;
    // can use `!` because we know that the book is finished so it's already in the map
    final newBookCounts = _booksPerYear[year]!  - 1;
    final Map<Year, BookCounts> newBooksPerYear =
        SplayTreeMap.from(_booksPerYear);
    newBooksPerYear[year] = newBookCounts;
    return BooksPerYear(newBooksPerYear);
  }

  List<Year> get years => _booksPerYear.keys.toList();

  List<Year> get bookCounts => _booksPerYear.values.toList();

  @override
  List<Object> get props => [_booksPerYear];
}
