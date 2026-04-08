import 'dart:collection';

import 'package:equatable/equatable.dart';

import '../../../../core/entities/book.dart';

typedef BookCounts = int;

final class BooksPerStateData extends Equatable {
  BooksPerStateData(Map<ComparableBookState, BookCounts> booksPerState)
    : _booksPerState = SplayTreeMap.from(booksPerState);

  BooksPerStateData.empty() : _booksPerState = SplayTreeMap.from({});

  final SplayTreeMap<ComparableBookState, BookCounts> _booksPerState;

  BooksPerStateData move(BookState fromState, BookState toState) {
    final from = ComparableBookState(fromState);
    final to = ComparableBookState(toState);
    final newToBookCounts = (_booksPerState[to] ?? 0) + 1;
    // if state has no books,then after this line it will have 0 books
    final newFromBookCounts = (_booksPerState[from] ?? 1) - 1;
    final Map<ComparableBookState, BookCounts> newBooksPerState =
        SplayTreeMap.from(_booksPerState);
    newBooksPerState[to] = newToBookCounts;
    newBooksPerState[from] = newFromBookCounts;
    return BooksPerStateData(newBooksPerState);
  }

  BookCounts operator [](BookState state) =>
      _booksPerState[ComparableBookState(state)] ?? 0;

  @override
  List<Object> get props => [_booksPerState];
}
