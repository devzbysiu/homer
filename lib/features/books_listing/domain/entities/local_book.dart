import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:faker/faker.dart';

import '../../../tags_manager/domain/entities/tag.dart';

var faker = Faker();

const someIsbns = [
  '0062878948',
  '0747532745',
  '0545010225',
  '0061703877',
  '1740474619',
  '0761156976',
  '0142421332',
  '0415263042',
  '0679887008',
];

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

  factory LocalBook.fake({bool withTags = true}) {
    return LocalBook(
      title: faker.lorem
          .words(faker.randomGenerator.integer(8, min: 1))
          .join(' ')
          .capitalize(),
      subtitle: faker.lorem.sentence(),
      authors: ['${faker.person.firstName()} ${faker.person.lastName()}'],
      state: LocalBookState.readLater,
      pageCount: faker.randomGenerator.integer(1000),
      isbn: faker.guid.guid(),
      thumbnailAddress: some(
          'https://covers.openlibrary.org/b/isbn/${someIsbns[faker.randomGenerator.integer(someIsbns.length)]}-M.jpg'),
      rating: faker.randomGenerator.decimal(scale: 10),
      summary: faker.lorem.sentences(10).join(" "),
      tags: withTags
          ? {const Tag(name: 'type:technical', color: TagColor.orange)}
          : {},
      dateModified: DateTime.now(),
    );
  }

  final String title;

  final String subtitle;

  final List<String> authors;

  final LocalBookState state;

  final int pageCount;

  final String isbn;

  final Option<String> thumbnailAddress;

  final double rating;

  final String? summary;

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
    String? summary,
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

extension _StringExt on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
