import 'package:dartz/dartz.dart';
import 'package:homer/features/find_new_book/data/models/external_book_info_dto.dart';

extension ExternalBookInfoDTOCopyWith on ExternalBookInfoDTO {
  ExternalBookInfoDTO copyWith({
    String? title,
    Option<String>? isbn10,
    Option<String>? isbn13,
  }) {
    return ExternalBookInfoDTO(
      title: title ?? this.title,
      isbn10: isbn10 ?? this.isbn10,
      isbn13: isbn13 ?? this.isbn13,
    );
  }
}
