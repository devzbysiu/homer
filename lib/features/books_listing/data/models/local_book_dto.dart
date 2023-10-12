import 'package:isar/isar.dart';

import 'local_tag_dto.dart';

part 'local_book_dto.g.dart';

@collection
final class LocalBookDTO {
  LocalBookDTO({
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

  Id id = Isar.autoIncrement;

  final String title;

  final String subtitle;

  final List<String> authors;

  @enumerated
  final LocalBookStateDTO state;

  final int pageCount;

  final String isbn;

  final String? thumbnailAddress;

  final double rating;

  final String? summary;

  final List<LocalTagDTO> tags;

  final int dateModified;
}

enum LocalBookStateDTO {
  readLater,
  reading,
  read,
}
