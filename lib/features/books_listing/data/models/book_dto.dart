import 'package:isar/isar.dart';

import 'tag_dto.dart';

part 'book_dto.g.dart';

@collection
final class BookDTO {
  BookDTO({
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
    required this.tags,
  });

  Id id = Isar.autoIncrement;

  final String title;

  final String subtitle;

  final String author;

  @enumerated
  final BookStateDTO state;

  final int pageCount;

  final String isbn;

  final String? thumbnailAddress;

  final int startDate;

  final int endDate;

  final double rating;

  final String? summary;

  final List<TagDTO> tags;
}

enum BookStateDTO {
  readLater,
  reading,
  read,
}
