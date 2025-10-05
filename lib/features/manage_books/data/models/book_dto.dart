import 'package:equatable/equatable.dart';

import 'tag_dto.dart';

class BookDTO extends Equatable {
  BookDTO({
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

  int? id;

  final String title;
  final String subtitle;
  final List<String> authors;
  final BookStateDTO state;
  final int pageCount;
  final String isbn;
  final String? thumbnailAddress;
  final double rating;
  final String? summary;
  final List<TagDTO> tags;
  final int? startDate;
  final int? endDate;

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
