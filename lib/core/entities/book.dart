import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'tag.dart';

// TODO: This needs toString
final class Book extends Equatable {
  const Book({
    this.id,
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.state,
    required this.pageCount,
    required this.isbn,
    required this.thumbnailAddress,
    required this.rating,
    required this.summary,
    required this.tags,
    required this.startDate,
    required this.endDate,
    required this.alreadySaved,
  });

  final int? id;

  final String title;

  final String subtitle;

  final List<String> authors;

  final BookState state;

  final int pageCount;

  final String isbn;

  final Option<String> thumbnailAddress;

  final double rating;

  final Option<String> summary;

  final List<Tag> tags;

  final Option<DateTime> startDate;

  final Option<DateTime> endDate;

  final bool alreadySaved;

  Book copyWith({
    int? id,
    String? title,
    String? subtitle,
    List<String>? authors,
    BookState? state,
    int? pageCount,
    String? isbn,
    Option<String>? thumbnailAddress,
    double? rating,
    Option<String>? summary,
    List<Tag>? tags,
    Option<DateTime>? startDate,
    Option<DateTime>? endDate,
    bool? alreadySaved,
  }) {
    return Book(
      id: id ?? this.id,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      authors: authors ?? this.authors,
      state: state ?? this.state,
      pageCount: pageCount ?? this.pageCount,
      isbn: isbn ?? this.isbn,
      thumbnailAddress: thumbnailAddress ?? this.thumbnailAddress,
      rating: rating ?? this.rating,
      summary: summary ?? this.summary,
      tags: tags ?? this.tags,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      alreadySaved: alreadySaved ?? this.alreadySaved,
    );
  }

  Book moveRight() {
    final newState = state.moveRight();
    switch (newState) {
      case BookState.reading:
        return copyWith(state: newState, startDate: some(DateTime.now()));
      case BookState.read:
        return copyWith(state: newState, endDate: some(DateTime.now()));
      default:
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
      default:
        throw Exception('Should not happen');
    }
  }

  @override
  List<Object> get props => [
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
    // NOTE: Can those be removed?
    // startDate,
    // endDate,
  ];
}

enum BookState { readLater, reading, read }

final class ComparableBookState extends Equatable
    implements Comparable<ComparableBookState> {
  const ComparableBookState(this.state);

  final BookState state;

  @override
  int compareTo(ComparableBookState other) {
    return state.index.compareTo(other.state.index);
  }

  @override
  List<Object> get props => [state];
}

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
