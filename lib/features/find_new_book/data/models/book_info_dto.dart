import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'book_info_dto.g.dart';

@JsonSerializable()
final class BookInfoDTO extends Equatable {
  const BookInfoDTO({
    required this.title,
    required this.isbn10,
    required this.isbn13,
  });

  final String title;

  @JsonKey(fromJson: _toIsbn, toJson: _isbnToJson)
  final Option<String> isbn10;

  @JsonKey(fromJson: _toIsbn, toJson: _isbnToJson)
  final Option<String> isbn13;

  factory BookInfoDTO.fromJson(Map<String, dynamic> json) {
    return _$BookInfoDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$BookInfoDTOToJson(this);

  @override
  List<Object> get props => [title, isbn10, isbn13];
}

Option<String> _toIsbn(String isbn) {
  return isbn.isEmpty ? none() : some(isbn);
}

String _isbnToJson(Option<String> isbn) {
  return isbn.getOrElse(() => '');
}
