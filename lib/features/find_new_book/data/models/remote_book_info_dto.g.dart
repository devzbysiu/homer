// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'remote_book_info_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RemoteBookInfoDTO _$RemoteBookInfoDTOFromJson(Map<String, dynamic> json) =>
    RemoteBookInfoDTO(
      title: json['title'] as String,
      isbn10: _toIsbn(json['isbn10'] as String),
      isbn13: _toIsbn(json['isbn13'] as String),
    );

Map<String, dynamic> _$RemoteBookInfoDTOToJson(RemoteBookInfoDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'isbn10': _isbnToJson(instance.isbn10),
      'isbn13': _isbnToJson(instance.isbn13),
    };
