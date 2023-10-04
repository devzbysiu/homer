import 'tag_model.dart';

final class BookModel {
  BookModel({
    required this.title,
    required this.subtitle,
    required this.author,
    required this.state,
    required this.pageCount,
    required this.isbn,
    required this.thumbnailAddress,
    required this.startDate,
    required this.endDate,
    required this.rating,
    required this.summary,
    required this.tags,
  });

  factory BookModel.fromJson(Map<String, dynamic> json) => BookModel(
        title: json['title'],
        subtitle: json['subtitle'],
        author: json['author'],
        state: json['state'],
        pageCount: json['pageCount'],
        isbn: json['isbn'],
        thumbnailAddress: json['thumbnailAddress'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        rating: json['rating'],
        summary: json['summary'],
        tags: json['tags'],
      );

  Map<String, dynamic> toJson() => {
        'title': title,
        'subtitle': subtitle,
        'author': author,
        'state': state,
        'pageCount': pageCount,
        'isbn': isbn,
        'thumbnailAddress': thumbnailAddress,
        'startDate': startDate,
        'endDate': endDate,
        'rating': rating,
        'summary': summary,
        'tags': tags,
      };

  final String title;

  final String subtitle;

  final String author;

  final BookModelState state;

  final int pageCount;

  final String isbn;

  final String? thumbnailAddress;

  final int startDate;

  final int endDate;

  final double rating;

  final String? summary;

  final Set<TagModel> tags;
}

enum BookModelState {
  readLater,
  reading,
  read,
}
