import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../tags_manager/domain/entities/tag.dart';

final class LocalBook extends Equatable {
  const LocalBook({
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

  final LocalBookState state;

  final int pageCount;

  final String isbn;

  final Option<String> thumbnailAddress;

  final double rating;

  final Option<String> summary;

  final Set<Tag> tags;

  final Option<DateTime> startDate;

  final Option<DateTime> endDate;

  LocalBook copyWith({
    int? id,
    String? title,
    String? subtitle,
    List<String>? authors,
    LocalBookState? state,
    int? pageCount,
    String? isbn,
    Option<String>? thumbnailAddress,
    double? rating,
    Option<String>? summary,
    Set<Tag>? tags,
    Option<DateTime>? startDate,
    Option<DateTime>? endDate,
  }) {
    return LocalBook(
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

  LocalBook moveRight() {
    final newState = state.moveRight();
    switch (newState) {
      case LocalBookState.reading:
        return copyWith(state: newState, startDate: some(DateTime.now()));
      case LocalBookState.read:
        return copyWith(state: newState, endDate: some(DateTime.now()));
      default:
        throw Exception('Should not happen');
    }
  }

  LocalBook moveLeft() {
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

enum LocalBookState {
  readLater,
  reading,
  read,
}

extension StateChangeExt on LocalBookState {
  LocalBookState moveRight() {
    switch (this) {
      case LocalBookState.readLater:
        return LocalBookState.reading;
      case LocalBookState.reading:
        return LocalBookState.read;
      case LocalBookState.read:
        return this;
    }
  }

  LocalBookState moveLeft() {
    switch (this) {
      case LocalBookState.readLater:
        return this;
      case LocalBookState.reading:
        return LocalBookState.readLater;
      case LocalBookState.read:
        return LocalBookState.reading;
    }
  }
}
