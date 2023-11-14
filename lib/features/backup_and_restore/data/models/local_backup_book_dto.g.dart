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
      state: $enumDecode(_$BookStateEnumMap, json['state']),
      pageCount: json['pageCount'] as int,
      isbn: json['isbn'] as String,
      thumbnailAddress: _toThumbnailAddress(json['thumbnailAddress'] as String),
      rating: (json['rating'] as num).toDouble(),
      summary: _toSummary(json['summary'] as String),
      tags: (json['tags'] as List<dynamic>)
          .map((e) => Tag.fromJson(e as Map<String, dynamic>))
          .toList(),
      startDate: _toDate(json['startDate'] as int),
      endDate: _toDate(json['endDate'] as int),
    );

Map<String, dynamic> _$LocalBackupBookDTOToJson(LocalBackupBookDTO instance) =>
    <String, dynamic>{
      'title': instance.title,
      'subtitle': instance.subtitle,
      'authors': instance.authors,
      'state': _$BookStateEnumMap[instance.state]!,
      'pageCount': instance.pageCount,
      'isbn': instance.isbn,
      'thumbnailAddress': _thumbnailAddressToJson(instance.thumbnailAddress),
      'rating': instance.rating,
      'summary': _summaryToJson(instance.summary),
      'tags': instance.tags,
      'startDate': _dateToJson(instance.startDate),
      'endDate': _dateToJson(instance.endDate),
    };

const _$BookStateEnumMap = {
  BookState.readLater: 'readLater',
  BookState.reading: 'reading',
  BookState.read: 'read',
};
