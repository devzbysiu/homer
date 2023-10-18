import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

final class RestoredBook extends Equatable {
  const RestoredBook({
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

  final RestoredBookState state;

  final int pageCount;

  final String isbn;

  final Option<String> thumbnailAddress;

  final double rating;

  final String? summary;

  final Set<RestoredTag> tags;

  final DateTime dateModified;

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
      ];
}

enum RestoredBookState {
  readLater,
  reading,
  read,
}

final class RestoredTag {
  RestoredTag({required this.title, required this.color});

  final String title;

  final RestoredTagColor color;
}

enum RestoredTagColor {
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
