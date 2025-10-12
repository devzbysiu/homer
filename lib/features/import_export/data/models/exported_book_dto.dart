import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/utils/date_option_ext.dart';
import 'exported_tag_dto.dart';

part 'exported_book_dto.g.dart';

@JsonSerializable()
final class ExportedBookDTO extends Equatable {
  const ExportedBookDTO({
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

  final String title;

  final String subtitle;

  final List<String> authors;

  final BookState state;

  final int pageCount;

  final String isbn;

  @JsonKey(fromJson: _toThumbnailAddress, toJson: _thumbnailAddressToJson)
  final Option<String> thumbnailAddress;

  final double rating;

  @JsonKey(fromJson: _toSummary, toJson: _summaryToJson)
  final Option<String> summary;

  final List<ExportedTagDTO> tags;

  @JsonKey(fromJson: _toDate, toJson: _dateToJson)
  final Option<DateTime> startDate;

  @JsonKey(fromJson: _toDate, toJson: _dateToJson)
  final Option<DateTime> endDate;

  factory ExportedBookDTO.fromJson(Map<String, dynamic> json) {
    return _$ExportedBookDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$ExportedBookDTOToJson(this);

  @override
  List<Object> get props => [
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

Option<String> _toThumbnailAddress(String thumbnail) {
  return thumbnail == '' ? none() : some(thumbnail);
}

String _thumbnailAddressToJson(Option<String> thumbnail) {
  return thumbnail.getOrElse(() => '');
}

Option<DateTime> _toDate(int millisSinceEpoch) {
  return millisSinceEpoch == 0
      ? none()
      : some(DateTime.fromMillisecondsSinceEpoch(millisSinceEpoch));
}

int _dateToJson(Option<DateTime> date) {
  return date.millisSinceEpoch();
}

Option<String> _toSummary(String summary) {
  return summary.isEmpty ? none() : some(summary);
}

String _summaryToJson(Option<String> summary) {
  return summary.getOrElse(() => '');
}
