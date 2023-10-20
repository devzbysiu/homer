// TODO: This should be removed after successful move form dante
import 'package:equatable/equatable.dart';

final class DanteBackupDTO extends Equatable {
  factory DanteBackupDTO.fromJson(Map<String, dynamic> json) {
    return DanteBackupDTO._(
      title: json['title'],
      subTitle: json['subTitle'],
      author: json['author'],
      state: _toRestoredBookStateDTO(json['state']),
      pageCount: json['pageCount'],
      isbn: json['isbn'],
      thumbnailAddress: json['thumbnailAddress'] ?? '',
      // TODO: take care of rating so it matches your current model
      rating: (json['rating'] as num).toDouble(),
      summary: json['summary'] ?? '',
      labels: _toLabelDTOs(json['labels']),
      endDate: json['endDate'] as int,
    );
  }

  const DanteBackupDTO._({
    required this.title,
    required this.subTitle,
    required this.author,
    required this.state,
    required this.pageCount,
    required this.isbn,
    required this.thumbnailAddress,
    required this.rating,
    required this.summary,
    required this.labels,
    required this.endDate,
  });

  final String title;

  final String subTitle;

  final String author;

  final RestoredBookStateDTO state;

  final int pageCount;

  final String isbn;

  final String thumbnailAddress;

  final double rating;

  final String summary;

  final Set<LabelDTO> labels;

  final int endDate;

  @override
  List<Object?> get props => [
        title,
        subTitle,
        author,
        state,
        pageCount,
        isbn,
        thumbnailAddress,
        rating,
        summary,
        labels,
      ];
}

Set<LabelDTO> _toLabelDTOs(List<dynamic> json) {
  return json.map((labelJson) => LabelDTO.fromJson(labelJson)).toSet();
}

RestoredBookStateDTO _toRestoredBookStateDTO(String stateStr) {
  switch (stateStr) {
    case 'READ_LATER':
      return RestoredBookStateDTO.forLater;
    case 'READING':
      return RestoredBookStateDTO.reading;
    case 'READ':
      return RestoredBookStateDTO.read;
    default:
      throw Exception('Invalid state: $stateStr');
  }
}

enum RestoredBookStateDTO { forLater, reading, read }

final class LabelDTO {
  factory LabelDTO.fromJson(Map<String, dynamic> json) {
    return LabelDTO._(title: json['title'], color: json['hexColor']);
  }

  LabelDTO._({required this.title, required this.color});

  final String title;

  final String color;
}
