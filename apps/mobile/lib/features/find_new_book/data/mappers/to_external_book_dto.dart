import 'package:homer_api_client/homer_api_client.dart' as api;

import '../models/external_book_dto.dart';

ExternalBookDTO toExternalBookDTO(api.Book book) {
  return ExternalBookDTO(
    title: book.title,
    subtitle: book.subtitle,
    authors: book.authors,
    pageCount: book.pageCount,
    industryIdentifiers: book.industryIdentifiers,
    imageLinks: book.imageLinks.map((key, url) => MapEntry(key, Uri.parse(url))),
    averageRating: book.averageRating,
    description: book.description,
  );
}
