import 'package:books_finder/books_finder.dart';

import '../models/remote_book_dto.dart';

abstract class RemoteBooksDataSource {
  Future<List<RemoteBookDTO>> getBooks(String query);
}

final class GoogleBooks extends RemoteBooksDataSource {
  @override
  Future<List<RemoteBookDTO>> getBooks(String query) async {
    final List<Book> books = await queryBooks(query);
    return books.map(_toDTO).toList();
  }

  RemoteBookDTO _toDTO(Book book) {
    return RemoteBookDTO(
      title: book.info.title,
      subtitle: book.info.subtitle,
      authors: book.info.authors,
      pageCount: book.info.pageCount,
      industryIdentifiers: book.info.industryIdentifiers,
      imageLinks: book.info.imageLinks,
      averageRating: book.info.averageRating,
      description: book.info.description,
    );
  }
}
