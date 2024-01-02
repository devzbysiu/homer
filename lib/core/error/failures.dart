import 'package:equatable/equatable.dart';

import '../entities/book.dart';

abstract class Failure {
  String userMessage();
}

final class InvalidUrlSharedFailure extends Equatable implements Failure {
  const InvalidUrlSharedFailure(this.url);

  final String url;

  @override
  String toString() => 'This is not correct URL: $url';

  @override
  String userMessage() => toString();

  @override
  List<Object> get props => [url];
}

final class NoIsbnFailure extends Equatable implements Failure {
  const NoIsbnFailure(this.url);

  final String url;

  @override
  String userMessage() => 'No ISBN found on shared page: $url';

  @override
  List<Object?> get props => [url];
}

final class NoBookWithIsbnFailure extends Equatable implements Failure {
  const NoBookWithIsbnFailure(this.isbn);

  final String isbn;

  @override
  String userMessage() => 'Could not find book with ISBN $isbn';

  @override
  List<Object> get props => [isbn];
}

final class TooManyBooksFoundFailure extends Equatable implements Failure {
  const TooManyBooksFoundFailure(this.isbn);

  final String isbn;

  @override
  String userMessage() {
    return 'Too many books found for ISBN: $isbn. Make sure '
        'it is correct ISBN value';
  }

  @override
  List<Object> get props => [isbn];
}

final class TimeoutOnApiResponseFailure extends Equatable implements Failure {
  const TimeoutOnApiResponseFailure();

  @override
  String userMessage() => 'Waiting too long for the response';

  @override
  List<Object> get props => [];
}

final class MissingBackupFileFailure extends Equatable implements Failure {
  const MissingBackupFileFailure(this.path);

  final String path;

  @override
  String userMessage() => 'Failed to load backup from path "$path"';

  @override
  List<Object> get props => [path];
}

final class ServerFailure extends Equatable implements Failure {
  @override
  String userMessage() => 'Server failure';

  @override
  List<Object> get props => [];
}

final class SearchingForBooksFailure extends Equatable implements Failure {
  @override
  String userMessage() => 'Something went wrong when searching books';

  @override
  List<Object> get props => [];
}

final class ListingBooksFailure extends Equatable implements Failure {
  @override
  String userMessage() => 'Something went wrong when listing books';

  @override
  List<Object> get props => [];
}

final class AddingBookFailure extends Equatable implements Failure {
  const AddingBookFailure(this.book);

  final Book book;

  @override
  String userMessage() => 'Something went wrong when adding book: $book';

  @override
  List<Object> get props => [book];
}

final class ReplacingBooksFailure extends Equatable implements Failure {
  const ReplacingBooksFailure(this.books);

  final List<Book> books;

  @override
  String userMessage() =>
      'Something went wrong when replacing books with: $books';

  @override
  List<Object> get props => [books];
}

final class UpdatingBookFailure extends Equatable implements Failure {
  const UpdatingBookFailure(this.book);

  final Book book;

  @override
  String userMessage() => 'Something went wrong when updating book: $book';

  @override
  List<Object> get props => [book];
}

final class DeletingBooksFailure extends Equatable implements Failure {
  const DeletingBooksFailure(this.books);

  final List<Book> books;

  @override
  String userMessage() => 'Something went wrong when deleting books: $books';

  @override
  List<Object> get props => [books];
}
