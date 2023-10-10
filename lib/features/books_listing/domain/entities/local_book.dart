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
  });

  factory LocalBook.fake({bool withTags = true}) {
    return LocalBook(
      title: faker.lorem
          .words(faker.randomGenerator.integer(8, min: 1))
          .join(' ')
          .capitalize(),
      subtitle: faker.lorem.sentence(),
      authors: ['${faker.person.firstName()} ${faker.person.lastName()}'],
      state: BookState.readLater,
      pageCount: faker.randomGenerator.integer(1000),
      isbn: faker.guid.guid(),
      thumbnailAddress: some(
          'https://covers.openlibrary.org/b/isbn/${someIsbns[faker.randomGenerator.integer(someIsbns.length)]}-M.jpg'),
      rating: faker.randomGenerator.decimal(scale: 10),
      summary: faker.lorem.sentences(10).join(" "),
      tags: withTags
          ? {const Tag(name: 'type:technical', color: TagColor.orange)}
          : {},
    );
  }

  final String title;

  final String subtitle;

  final List<String> authors;

  final BookState state;

  final int pageCount;

  final String isbn;

  final Option<String> thumbnailAddress;

  final double rating;

  final String? summary;

  final Set<Tag> tags;

  LocalBook copyWith({
    String? title,
    String? subtitle,
    List<String>? authors,
    BookState? state,
    int? pageCount,
    String? isbn,
    Option<String>? thumbnailAddress,
    int? startDate,
    int? endDate,
    double? rating,
    String? summary,
    Set<Tag>? tags,
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

final class BookTag {
  BookTag({required this.name});

  final String name;
}

extension _StringExt on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
