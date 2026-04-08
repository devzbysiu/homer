// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookDTO _$BookDTOFromJson(Map<String, dynamic> json) => _BookDTO(
  id: (json['id'] as num?)?.toInt(),
  title: json['title'] as String,
  subtitle: json['subtitle'] as String,
  authors: (json['authors'] as List<dynamic>).map((e) => e as String).toList(),
  state: $enumDecode(_$BookStateDTOEnumMap, json['state']),
  pageCount: (json['pageCount'] as num).toInt(),
  isbn: json['isbn'] as String,
  thumbnailAddress: json['thumbnailAddress'] as String?,
  rating: (json['rating'] as num).toDouble(),
  summary: json['summary'] as String?,
  tags: (json['tags'] as List<dynamic>)
      .map((e) => TagDTO.fromJson(e as Map<String, dynamic>))
      .toList(),
  startDate: (json['startDate'] as num?)?.toInt(),
  endDate: (json['endDate'] as num?)?.toInt(),
);

Map<String, dynamic> _$BookDTOToJson(_BookDTO instance) => <String, dynamic>{
  'id': instance.id,
  'title': instance.title,
  'subtitle': instance.subtitle,
  'authors': instance.authors,
  'state': _$BookStateDTOEnumMap[instance.state]!,
  'pageCount': instance.pageCount,
  'isbn': instance.isbn,
  'thumbnailAddress': instance.thumbnailAddress,
  'rating': instance.rating,
  'summary': instance.summary,
  'tags': instance.tags,
  'startDate': instance.startDate,
  'endDate': instance.endDate,
};

const _$BookStateDTOEnumMap = {
  BookStateDTO.readLater: 'readLater',
  BookStateDTO.reading: 'reading',
  BookStateDTO.read: 'read',
};
