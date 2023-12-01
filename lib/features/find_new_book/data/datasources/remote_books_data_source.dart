import 'package:books_finder/books_finder.dart';

import '../../../../core/error/exceptions.dart';
import '../mappers/to_remote_book_dto.dart';
import '../models/remote_book_dto.dart';

abstract class RemoteBooksDataSource {
  Future<List<RemoteBookDTO>> getFromQuery(String query);

  Future<RemoteBookDTO> getFromIsbn(String url);
}

final class ExternalBooks implements RemoteBooksDataSource {
  @override
  Future<List<RemoteBookDTO>> getFromQuery(String query) async {
    final List<Book> books = await queryBooks(query);
    return books.map(toRemoteBookDTO).toList();
  }

  @override
  Future<RemoteBookDTO> getFromIsbn(String isbn) async {
    final List<Book> books = await queryBooks(isbn, queryType: QueryType.isbn);
    if (books.isEmpty) throw NoBookWithIsbnFoundException(isbn);
    if (books.length > 1) throw TooManyBooksFoundException(isbn);
    return toRemoteBookDTO(books.first);
  }
}
