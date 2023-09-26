import 'package:faker/faker.dart';

var faker = Faker();

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
      title: faker.lorem.sentence(),
      subtitle: faker.lorem.sentence(),
      author: '${faker.person.firstName()} ${faker.person.lastName()}',
      state: BookState.readLater,
      pageCount: faker.randomGenerator.integer(1000),
      isbn: faker.guid.guid(),
      thumbnailAddress: faker.internet.httpsUrl(),
      startDate: faker.date.dateTime().microsecondsSinceEpoch,
      endDate: faker.date.dateTime().microsecondsSinceEpoch,
      rating: faker.randomGenerator.integer(10),
      summary: faker.lorem.sentences(10).join(" "),
      labels: List.empty(),
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

  final int rating;

  final String? summary;

  final List<BookLabel> labels;
}

enum BookState {
  readLater,
  reading,
  read,
}

class BookLabel {}
