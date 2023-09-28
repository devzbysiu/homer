import 'package:faker/faker.dart';
import 'package:homer/core/book/domain/use_case/books/books_bloc.dart';

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

class BookEntity {
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

  BookEntity copyWith({BookState? state}) {
    return BookEntity(
      title: title,
      subtitle: subtitle,
      author: author,
      state: state ?? this.state,
      pageCount: pageCount,
      isbn: isbn,
      thumbnailAddress: thumbnailAddress,
      startDate: startDate,
      endDate: endDate,
      rating: rating,
      summary: summary,
      labels: labels,
    );
  }
}

enum BookState {
  readLater,
  reading,
  read,
}

class BookLabel {
  BookLabel({required this.name});

  final String name;
}

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
  }
}
