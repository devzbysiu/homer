import 'package:equatable/equatable.dart';

final class RemoteBook extends Equatable {
  const RemoteBook({
    required this.title,
    required this.subtitle,
    required this.authors,
    required this.pageCount,
    required this.isbn,
    required this.imageLinks,
    required this.averageRating,
    required this.description,
  });

  final String title;

  final String subtitle;

  final List<String> authors;

  final int pageCount;

  final String isbn;

  final Map<String, Uri> imageLinks;

  final double averageRating;

  final String? description;

  @override
  List<Object?> get props => [
        title,
        subtitle,
        authors,
        pageCount,
        isbn,
        imageLinks,
        averageRating,
        description,
      ];
}
