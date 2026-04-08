import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'tag.dart';

part 'book.freezed.dart';

@Freezed(equal: false, toStringOverride: false)
abstract class Book with _$Book, EquatableMixin {
  const Book._(); // for custom methods

  const factory Book({
    int? id,
    required String title,
    required String subtitle,
    required List<String> authors,
    required BookState state,
    required int pageCount,
    required String isbn,
    required Option<String> thumbnailAddress,
    required double rating,
    required Option<String> summary,
    required List<Tag> tags,
    required Option<DateTime> startDate,
    required Option<DateTime> endDate,
    required bool alreadySaved,
  }) = _Book;

  @override
  List<Object?> get props => [
    title,
    subtitle,
    authors,
    state,
    pageCount,
    isbn,
    thumbnailAddress,
    rating,
    summary,
    tags,
    alreadySaved,
  ];

  @override
  String toString() => 'Book(title: $title)';

  Option<Book> move(Swiped dir) {
    return switch (dir) {
      Swiped.left => _moveLeft(),
      Swiped.right => _moveRight(),
    };
  }

  Option<Book> _moveRight() {
    final newState = state.moveRight();
    if (newState.isNone()) return none();
    final st = newState.toNullable()!;
    // switch on OLD state
    switch (state) {
      case BookState.readLater:
        // moved right from readLater => it's reading now, so update startDate
        return Some(copyWith(state: st, startDate: some(DateTime.now())));
      case BookState.reading:
        // moved right from reading => it's finished now, so update endDate
        return Some(copyWith(state: st, endDate: some(DateTime.now())));
      case BookState.read:
        throw Exception("Can't move read book to right");
    }
  }

  Option<Book> _moveLeft() {
    final newState = state.moveLeft();
    if (newState.isNone()) return none();
    final st = newState.toNullable()!;
    // switch on OLD state
    switch (state) {
      case BookState.readLater:
        throw Exception("Can't move readLater book to left");
      case BookState.reading:
        // moved left from reading => it's readLater now, so reset startDate
        return Some(copyWith(state: st, startDate: none()));
      case BookState.read:
        // moved left from read => it's reading now, so reset endDate
        return Some(copyWith(state: st, endDate: none()));
    }
  }
}

enum BookState { readLater, reading, read }

extension StateChangeExt on BookState {
  Option<BookState> moveRight() {
    return optionOf(switch (this) {
      BookState.readLater => BookState.reading,
      BookState.reading => BookState.read,
      BookState.read => null,
    });
  }

  Option<BookState> moveLeft() {
    return optionOf(switch (this) {
      BookState.readLater => null,
      BookState.reading => BookState.readLater,
      BookState.read => BookState.reading,
    });
  }
}

@freezed
abstract class ComparableBookState
    with _$ComparableBookState
    implements Comparable<ComparableBookState> {
  const ComparableBookState._();

  const factory ComparableBookState(BookState state) = _ComparableBookState;

  @override
  int compareTo(ComparableBookState other) =>
      state.index.compareTo(other.state.index);
}

enum Swiped { left, right }
