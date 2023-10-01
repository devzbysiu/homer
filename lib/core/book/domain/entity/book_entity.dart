import 'package:equatable/equatable.dart';
import 'package:faker/faker.dart';

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

final class BookEntity extends Equatable {
  const BookEntity({
    required this.title,
    required this.subtitle,
    required this.author,
    required this.state,
    required this.pageCount,
    required this.isbn,
    required this.thumbnailAddress,
    required this.startDate,
    required this.endDate,
    required this.rating,
    required this.summary,
    required this.labels,
  });

  factory BookEntity.fake() {
    return BookEntity(
      title: faker.lorem
          .words(faker.randomGenerator.integer(8, min: 1))
          .join(' ')
          .capitalize(),
      subtitle: faker.lorem.sentence(),
      author: '${faker.person.firstName()} ${faker.person.lastName()}',
      state: BookState.readLater,
      pageCount: faker.randomGenerator.integer(1000),
      isbn: faker.guid.guid(),
      thumbnailAddress:
          'https://covers.openlibrary.org/b/isbn/${someIsbns[faker.randomGenerator.integer(someIsbns.length)]}-M.jpg',
      startDate: faker.date.dateTime().microsecondsSinceEpoch,
      endDate: faker.date.dateTime().microsecondsSinceEpoch,
      rating: faker.randomGenerator.decimal(scale: 10),
      summary: faker.lorem.sentences(10).join(" "),
      labels: [
        BookLabel(name: 'type:technical'),
        BookLabel(name: 'short'),
      ],
    );
  }

  final String title;

  final String subtitle;

  final String author;

  final BookState state;

  final int pageCount;

  final String isbn;

  final String? thumbnailAddress;

  final int startDate;

  final int endDate;

  final double rating;

  final String? summary;

  final List<BookLabel> labels;

  BookEntity copyWith({
    String? title,
    String? subtitle,
    String? author,
    BookState? state,
    int? pageCount,
    String? isbn,
    String? thumbnailAddress,
    int? startDate,
    int? endDate,
    double? rating,
    String? summary,
    List<BookLabel>? labels,
  }) {
    return BookEntity(
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      author: author ?? this.author,
      state: state ?? this.state,
      pageCount: pageCount ?? this.pageCount,
      isbn: isbn ?? this.isbn,
      thumbnailAddress: thumbnailAddress ?? this.thumbnailAddress,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      rating: rating ?? this.rating,
      summary: summary ?? this.summary,
      labels: labels ?? this.labels,
    );
  }

  BookEntity moveRight() {
    return copyWith(state: state.moveRight());
  }

  BookEntity moveLeft() {
    return copyWith(state: state.moveLeft());
  }

  @override
  List<Object?> get props => [
        title,
        subtitle,
        author,
        state,
        pageCount,
        isbn,
        thumbnailAddress,
        startDate,
        endDate,
        rating,
        summary,
        labels,
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

class BookLabel {
  BookLabel({required this.name});

  final String name;
}

extension _StringExt on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
