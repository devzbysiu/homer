import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'remote_book_info_dto.g.dart';

@JsonSerializable()
final class RemoteBookInfoDTO extends Equatable {
  const RemoteBookInfoDTO({
    required this.title,
    required this.isbn10,
    required this.isbn13,
  });

  final String title;

  @JsonKey(fromJson: _toIsbn, toJson: _isbnToJson)
  final Option<String> isbn10;

  @JsonKey(fromJson: _toIsbn, toJson: _isbnToJson)
  final Option<String> isbn13;

  factory RemoteBookInfoDTO.fromJson(Map<String, dynamic> json) {
    return _$RemoteBookInfoDTOFromJson(json);
  }

  Map<String, dynamic> toJson() => _$RemoteBookInfoDTOToJson(this);

  @override
  List<Object> get props => [title, isbn10, isbn13];
}

Option<String> _toIsbn(String isbn) {
  return isbn.isEmpty ? none() : some(isbn);
}

String _isbnToJson(Option<String> isbn) {
  return isbn.getOrElse(() => '');
}
