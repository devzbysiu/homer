import '../entities/book.dart';

final class NoBookFoundException implements Exception {
  const NoBookFoundException(this.isbn);

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

final class NotJsonException implements Exception {
  const NotJsonException(this.message);

  final String message;

  @override
  String toString() => 'There is something wrong with the server: $message';
}

final class WrongJsonException implements Exception {
  const WrongJsonException(this.e);

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

final class ListBooksException implements Exception {
  @override
  String toString() => 'Exception while listing books';
}

final class AddBookException implements Exception {
  @override
  String toString() => 'Exception while adding book';
}

final class ReplaceBooksException implements Exception {
  @override
  String toString() => 'Exception while replacing books';
}

final class UpdateBookException implements Exception {
  @override
  String toString() => 'Exception while updating book';
}

final class DeleteBooksException implements Exception {
  @override
  String toString() => 'Exception while deleting books';
}