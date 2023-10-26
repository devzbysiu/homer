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
    required this.startDate,
    required this.endDate,
  });

  final String title;

  final String subtitle;

  final List<String> authors;

  final RestoredBookState state;

  final int pageCount;

  final String isbn;

  final Option<String> thumbnailAddress;

  final double rating;

  final Option<String> summary;

  final Set<RestoredTag> tags;

  final Option<DateTime> startDate;

  final Option<DateTime> endDate;

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
        startDate,
        endDate,
      ];
}

enum RestoredBookState {
  readLater,
  reading,
  read,
}

final class RestoredTag {
  RestoredTag({required this.title, required this.hexColor});

  final String title;

  final String hexColor;
}
