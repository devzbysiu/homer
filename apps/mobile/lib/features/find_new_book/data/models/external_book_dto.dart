import 'package:equatable/equatable.dart';

final class ExternalBookDTO extends Equatable {
  const ExternalBookDTO({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.pageCount,
    required this.industryIdentifiers,
    required this.imageLinks,
    required this.averageRating,
    required this.description,
  });

  final String title;

  final String subtitle;

  final List<String> authors;

  final int pageCount;

  final List<String> industryIdentifiers;

  final Map<String, Uri> imageLinks;

  final double averageRating;

  final String? description;

  @override
  List<Object?> get props => [
    title,
    subtitle,
    authors,
    pageCount,
    industryIdentifiers,
    imageLinks,
    averageRating,
    description,
  ];
}
