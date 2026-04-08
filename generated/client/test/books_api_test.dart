import 'package:test/test.dart';
import 'package:homer_api_client/homer_api_client.dart';


/// tests for BooksApi
void main() {
  final instance = HomerApiClient().getBooksApi();

  group(BooksApi, () {
    // Look up a single book by ISBN
    //
    // Returns exactly one book for the given ISBN-10 or ISBN-13.  Note: the literal path `/books/info` is matched before this parameter, so `GET /books/info` and `GET /books/{isbn}` do not conflict. 
    //
    //Future<Book> getBookByIsbn(String isbn) async
    test('test getBookByIsbn', () async {
      // TODO
    });

    // Search books by text query
    //
    //Future<List<Book>> searchBooks(String q) async
    test('test searchBooks', () async {
      // TODO
    });

  });
}
