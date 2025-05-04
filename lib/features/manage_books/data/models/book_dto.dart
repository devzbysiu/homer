import 'package:equatable/equatable.dart';
import 'package:isar/isar.dart';

import 'tag_dto.dart';

part 'book_dto.g.dart';

@Collection(inheritance: false)
// ignore: must_be_immutable
final class BookDTO extends Equatable {
  BookDTO({
    this.id = Isar.autoIncrement,
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

  Id id;

  final String title;

  final String subtitle;

  final List<String> authors;

  @enumerated
  final BookStateDTO state;

  final int pageCount;

  final String isbn;

  final String? thumbnailAddress;

  final double rating;

  final String? summary;

  final List<TagDTO> tags;

  final int? startDate;

  final int? endDate;

  @ignore
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

enum BookStateDTO { readLater, reading, read }
