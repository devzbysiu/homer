import 'package:books_finder/books_finder.dart';

import '../../../../core/error/exceptions.dart';
import '../mappers/to_remote_book_dto.dart';
import '../models/external_book_dto.dart';

abstract class ExternalBooksDataSource {
  Future<List<ExternalBookDTO>> getFromQuery(String query);

  Future<ExternalBookDTO> getFromIsbn(String url);
}

final class ExternalBooks implements ExternalBooksDataSource {
  @override
  Future<List<ExternalBookDTO>> getFromQuery(String query) async {
    try {
      final List<Book> books = await queryBooks(query);
      return books.map(toExternalBookDTO).toList();
    } catch (e) {
      throw BooksQueryException('$e');
    }
  }

  @override
  Future<ExternalBookDTO> getFromIsbn(String isbn) async {
    final List<Book> books = await queryBooks(isbn, queryType: QueryType.isbn);
    if (books.isEmpty) throw NoBookWithIsbnFoundException(isbn);
    if (books.length > 1) throw TooManyBooksFoundException(isbn);
    return toExternalBookDTO(books.first);
  }
}
