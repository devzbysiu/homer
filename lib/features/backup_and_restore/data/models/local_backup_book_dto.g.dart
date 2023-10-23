// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'local_backup_book_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocalBackupBookDTO _$LocalBackupBookDTOFromJson(Map<String, dynamic> json) =>
    LocalBackupBookDTO(
      title: json['title'] as String,
      subtitle: json['subtitle'] as String,
      authors:
          (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
      state: $enumDecode(_$LocalBackupBookStateDTOEnumMap, json['state']),
      pageCount: json['pageCount'] as int,
      isbn: json['isbn'] as String,
      thumbnailAddress: _toThumbnailAddress(json['thumbnailAddress'] as String),
      rating: (json['rating'] as num).toDouble(),
      summary: _toSummary(json['summary'] as String),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => LocalBackupTagDTO.fromJson(e as Map<String, dynamic>))
          .toSet(),
      startDate: _toDate(json['startDate'] as int),
      endDate: _toDate(json['endDate'] as int),
    );

Map<String, dynamic> _$LocalBackupBookDTOToJson(LocalBackupBookDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'state': _$LocalBackupBookStateDTOEnumMap[instance.state]!,
      'pageCount': instance.pageCount,
      'isbn': instance.isbn,
      'thumbnailAddress': _thumbnailAddressToJson(instance.thumbnailAddress),
      'rating': instance.rating,
      'summary': _summaryToJson(instance.summary),
      'tags': instance.tags.toList(),
      'startDate': _dateToJson(instance.startDate),
      'endDate': _dateToJson(instance.endDate),
    };

const _$LocalBackupBookStateDTOEnumMap = {
  LocalBackupBookStateDTO.readLater: 'readLater',
  LocalBackupBookStateDTO.reading: 'reading',
  LocalBackupBookStateDTO.read: 'read',
};

LocalBackupTagDTO _$LocalBackupTagDTOFromJson(Map<String, dynamic> json) =>
    LocalBackupTagDTO(
      name: json['name'] as String,
      color: $enumDecode(_$LocalBackupTagColorDTOEnumMap, json['color']),
    );

Map<String, dynamic> _$LocalBackupTagDTOToJson(LocalBackupTagDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'color': _$LocalBackupTagColorDTOEnumMap[instance.color]!,
    };

const _$LocalBackupTagColorDTOEnumMap = {
  LocalBackupTagColorDTO.red: 'red',
  LocalBackupTagColorDTO.green: 'green',
  LocalBackupTagColorDTO.blue: 'blue',
  LocalBackupTagColorDTO.black: 'black',
  LocalBackupTagColorDTO.brown: 'brown',
  LocalBackupTagColorDTO.orange: 'orange',
  LocalBackupTagColorDTO.yellow: 'yellow',
  LocalBackupTagColorDTO.grey: 'grey',
  LocalBackupTagColorDTO.purple: 'purple',
};
