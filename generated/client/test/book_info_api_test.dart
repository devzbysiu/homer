import 'package:test/test.dart';
import 'package:homer_api_client/homer_api_client.dart';


/// tests for BookInfoApi
void main() {
  final instance = HomerApiClient().getBookInfoApi();

  group(BookInfoApi, () {
    // Extract book metadata from a webpage URL
    //
    // Scrapes the given URL and returns whatever book metadata can be found: title and ISBN(s). Intended for resolving a shared book page URL into something searchable.  `isbn10` and `isbn13` are null when not found on the page. If neither is present the client can fall back to a text search using `title`. 
    //
    //Future<BookInfo> getBookInfoFromUrl(String url) async
    test('test getBookInfoFromUrl', () async {
      // TODO
    });

  });
}
