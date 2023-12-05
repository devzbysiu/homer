// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'external_book_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ExternalBookInfoDTO _$ExternalBookInfoDTOFromJson(Map<String, dynamic> json) =>
    ExternalBookInfoDTO(
      title: json['title'] as String,
      isbn10: _toIsbn(json['isbn10'] as String),
      isbn13: _toIsbn(json['isbn13'] as String),
    );

Map<String, dynamic> _$ExternalBookInfoDTOToJson(
        ExternalBookInfoDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'isbn10': _isbnToJson(instance.isbn10),
      'isbn13': _isbnToJson(instance.isbn13),
    };
