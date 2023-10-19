import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

final class LocalBackupBookDTO extends Equatable {
  const LocalBackupBookDTO({
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
    required this.dateModified,
  });

  final String title;

  final String subtitle;

  final List<String> authors;

  final LocalBackupBookStateDTO state;

  final int pageCount;

  final String isbn;

  final Option<String> thumbnailAddress;

  final double rating;

  final String? summary;

  final Set<LocalBackupTagDTO> tags;

  final DateTime dateModified;

  factory LocalBackupBookDTO.fromJson(Map<String, dynamic> json) {
    return LocalBackupBookDTO(
      title: json['title'],
      subtitle: json['subtitle'],
      authors: _toAuthors(json['authors']),
      state: _toLocalBackupBookStateDTO(json['state']),
      pageCount: json['pageCount'],
      isbn: json['isbn'],
      thumbnailAddress: _toThumbnailAddress(json['thumbnailAddress']),
      rating: json['rating'],
      summary: json['summary'],
      tags: _toLocalBackupTagDTOs(json['tags']),
      dateModified: DateTime.fromMicrosecondsSinceEpoch(json['dateModified']),
    );
  }

  Map<String, dynamic> toJson() => {
        'title': title,
        'subtitle': subtitle,
        'authors': authors,
        'state': state.name.toString(),
        'pageCount': pageCount,
        'isbn': isbn,
        'thumbnailAddress': thumbnailAddress.getOrElse(() => ''),
        'rating': rating,
        'summary': summary,
        'tags': tags.map((tag) => tag.toJson()).toList(),
        'dateModified': dateModified.microsecondsSinceEpoch,
      };

  @override
  List<Object?> get props => [
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
        dateModified,
      ];
}

List<String> _toAuthors(List<dynamic> json) {
  return json.map((value) => value as String).toList();
}

LocalBackupBookStateDTO _toLocalBackupBookStateDTO(String stateStr) {
  switch (stateStr) {
    case 'readLater':
      return LocalBackupBookStateDTO.readLater;
    case 'reading':
      return LocalBackupBookStateDTO.reading;
    case 'read':
      return LocalBackupBookStateDTO.read;
    default:
      throw Exception('Invalid state: $stateStr');
  }
}

Option<String> _toThumbnailAddress(String thumbnail) {
  return thumbnail == '' ? none() : some(thumbnail);
}

Set<LocalBackupTagDTO> _toLocalBackupTagDTOs(List<dynamic> json) {
  return json.map((jsonTag) {
    return LocalBackupTagDTO(
      name: jsonTag['name'],
      color: _toLocalBackupTagColorDTO(jsonTag['color']),
    );
  }).toSet();
}

LocalBackupTagColorDTO _toLocalBackupTagColorDTO(String color) {
  switch (color) {
    case 'red':
      return LocalBackupTagColorDTO.red;
    case 'green':
      return LocalBackupTagColorDTO.green;
    case 'blue':
      return LocalBackupTagColorDTO.blue;
    case 'black':
      return LocalBackupTagColorDTO.black;
    case 'brown':
      return LocalBackupTagColorDTO.brown;
    case 'orange':
      return LocalBackupTagColorDTO.orange;
    case 'yellow':
      return LocalBackupTagColorDTO.yellow;
    case 'grey':
      return LocalBackupTagColorDTO.grey;
    case 'purple':
      return LocalBackupTagColorDTO.purple;
    default:
      throw Exception('Invalid tag color: "$color"');
  }
}

enum LocalBackupBookStateDTO { readLater, reading, read }

final class LocalBackupTagDTO {
  LocalBackupTagDTO({required this.name, required this.color});

  final String name;

  final LocalBackupTagColorDTO color;

  Map<String, dynamic> toJson() => {
        'name': name,
        'color': color.name.toString(),
      };
}

enum LocalBackupTagColorDTO {
  red,
  green,
  blue,
  black,
  brown,
  orange,
  yellow,
  grey,
  purple,
}
