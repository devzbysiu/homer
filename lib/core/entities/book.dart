import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import 'tag.dart';

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
    return copyWith(state: state.moveLeft());
  }

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
        startDate,
        endDate,
      ];
}

enum BookState {
  readLater,
  reading,
  read,
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
