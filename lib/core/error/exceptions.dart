final class LocalDatasourceException implements Exception {}

final class NoBookWithIsbnFoundException implements Exception {
  const NoBookWithIsbnFoundException(this.isbn);

  final String isbn;

  @override
  String toString() => 'Could not find book with isbn: $isbn';
}

// TODO: Can this really happen?
final class TooManyBooksFoundException implements Exception {
  const TooManyBooksFoundException(this.isbn);

  final String isbn;

  @override
  String toString() => 'There is more than one book with isbn: $isbn';
}
