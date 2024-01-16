import 'dart:collection';

import 'package:equatable/equatable.dart';

typedef Year = int;

typedef BookCounts = int;

final class BooksPerYear extends Equatable {
  BooksPerYear(Map<Year, BookCounts> booksPerYear)
      : _booksPerYear = SplayTreeMap.from(booksPerYear);

  final SplayTreeMap<Year, BookCounts> _booksPerYear;

  List<Year> get years => _booksPerYear.keys.toList();

  List<Year> get bookCounts => _booksPerYear.values.toList();

  @override
  List<Object> get props => [_booksPerYear];
}
