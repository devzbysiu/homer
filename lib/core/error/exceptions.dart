final class NoBookWithIsbnFoundException implements Exception {
  const NoBookWithIsbnFoundException(this.isbn);

  final String isbn;

  @override
  String toString() => 'Could not find book with isbn: $isbn';
}

final class TooManyBooksFoundException implements Exception {
  const TooManyBooksFoundException(this.isbn);

  final String isbn;

  @override
  String toString() => 'There is more than one book with isbn: $isbn';
}

final class NoSettingsException implements Exception {
  @override
  String toString() => 'Settings not found';
}

final class InvalidUrlException implements Exception {
  const InvalidUrlException(this.url);

  final String url;

  @override
  String toString() => 'Invalid URL: $url';
}

final class IncorrectResponseException implements Exception {
  const IncorrectResponseException(this.message);

  final String message;

  @override
  String toString() => 'There is something wrong with the server: $message';
}

final class InvalidJsonException implements Exception {
  const InvalidJsonException(this.e);

  final Object e;

  @override
  String toString() => 'Incorrect json response: $e';
}

final class BooksQueryException implements Exception {
  const BooksQueryException(this.msg);

  final String msg;

  @override
  String toString() => 'Exception while searching for books: $msg';
}
