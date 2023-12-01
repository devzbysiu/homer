import 'package:books_finder/books_finder.dart';

import '../models/remote_book_dto.dart';

RemoteBookDTO toRemoteBookDTO(Book book) {
  return RemoteBookDTO(
    title: book.info.title,
    subtitle: book.info.subtitle,
    authors: book.info.authors,
    pageCount: book.info.pageCount,
    industryIdentifiers:
        book.info.industryIdentifiers.map((isbn) => isbn.identifier).toList(),
    imageLinks: book.info.imageLinks,
    averageRating: book.info.averageRating,
    description: book.info.description,
  );
}
