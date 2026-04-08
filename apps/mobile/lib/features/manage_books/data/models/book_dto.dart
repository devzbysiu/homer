import 'package:freezed_annotation/freezed_annotation.dart';

import 'tag_dto.dart';

part 'book_dto.freezed.dart';
part 'book_dto.g.dart';

@freezed
abstract class BookDTO with _$BookDTO {
  const factory BookDTO({
    int? id,
    required String title,
    required String subtitle,
    required List<String> authors,
    required BookStateDTO state,
    required int pageCount,
    required String isbn,
    String? thumbnailAddress,
    required double rating,
    String? summary,
    required List<TagDTO> tags,
    int? startDate,
    int? endDate,
  }) = _BookDTO;

  factory BookDTO.fromJson(Map<String, dynamic> json) =>
      _$BookDTOFromJson(json);
}

enum BookStateDTO { readLater, reading, read }
