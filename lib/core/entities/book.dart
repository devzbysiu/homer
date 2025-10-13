import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'tag.dart';

part 'book.freezed.dart';

@Freezed(equal: false)
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

  // Domain behaviors
  Book moveRight() {
    final newState = state.moveRight();
    switch (newState) {
      case BookState.reading:
        return copyWith(state: newState, startDate: some(DateTime.now()));
      case BookState.read:
        return copyWith(state: newState, endDate: some(DateTime.now()));
      case BookState.readLater:
        throw Exception('Should not happen');
    }
  }

  Book moveLeft() {
    final newState = state.moveLeft();
    switch (newState) {
      case BookState.readLater:
        return copyWith(state: newState, startDate: none());
      case BookState.reading:
        return copyWith(state: newState, endDate: none());
      case BookState.read:
        throw Exception('Should not happen');
    }
  }
}

enum BookState { readLater, reading, read }

extension StateChangeExt on BookState {
  BookState moveRight() {
    switch (this) {
      case BookState.readLater:
        return BookState.reading;
      case BookState.reading:
        return BookState.read;
      case BookState.read:
        return this;
    }
  }

  BookState moveLeft() {
    switch (this) {
      case BookState.readLater:
        return this;
      case BookState.reading:
        return BookState.readLater;
      case BookState.read:
        return BookState.reading;
    }
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
