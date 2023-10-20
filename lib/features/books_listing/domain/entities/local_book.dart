import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../../../tags_manager/domain/entities/tag.dart';

final class LocalBook extends Equatable {
  const LocalBook({
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
    required this.dateModified,
  });

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

  final DateTime dateModified;

  LocalBook copyWith({
    String? title,
    String? subtitle,
    List<String>? authors,
    LocalBookState? state,
    int? pageCount,
    String? isbn,
    Option<String>? thumbnailAddress,
    int? startDate,
    int? endDate,
    double? rating,
    Option<String>? summary,
    Set<Tag>? tags,
    DateTime? dateModified,
  }) {
    return LocalBook(
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
      dateModified: dateModified ?? this.dateModified,
    );
  }

  LocalBook moveRight() {
    return copyWith(state: state.moveRight());
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
        dateModified,
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
