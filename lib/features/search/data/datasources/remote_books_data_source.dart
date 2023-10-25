import 'package:books_finder/books_finder.dart';

import '../models/remote_book_dto.dart';

abstract class RemoteBooksDataSource {
  Future<List<RemoteBookDTO>> getFromQuery(String query);

  Future<RemoteBookDTO> getFromIsbn(String url);
}

final class ExternalBooks implements RemoteBooksDataSource {
  @override
  Future<List<RemoteBookDTO>> getFromQuery(String query) async {
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

  @override
  Future<RemoteBookDTO> getFromIsbn(String isbn) async {
    // TODO: Create concrete exceptions
    final List<Book> books = await queryBooks(isbn, queryType: QueryType.isbn);
    if (books.isEmpty) throw Exception('No books found by isbn: $isbn');
    if (books.length > 1) throw Exception('Too much found by isbn: $isbn');
    return _toDTO(books.first);
  }
}
