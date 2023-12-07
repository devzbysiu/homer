import 'package:equatable/equatable.dart';

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

final class NoBookWithIsbnFailure implements Failure {
  const NoBookWithIsbnFailure(this.isbn);

  final String isbn;

  @override
  String userMessage() => 'Could not find book with ISBN $isbn';
}

final class TooManyBooksFoundFailure implements Failure {
  const TooManyBooksFoundFailure(this.isbn);

  final String isbn;

  @override
  String userMessage() {
    return 'Too many books found for ISBN: $isbn. Make sure '
        'it is correct ISBN value';
  }
}

final class TimeoutOnApiResponseFailure implements Failure {
  const TimeoutOnApiResponseFailure();

  @override
  String userMessage() => 'Waiting too long for the response';
}

final class MissingBackupFileFailure extends Equatable implements Failure {
  const MissingBackupFileFailure(this.path);

  final String path;

  @override
  String userMessage() => 'Failed to load backup from path "$path"';

  @override
  List<Object> get props => [path];
}

final class ServerFailure implements Failure {
  @override
  String userMessage() => 'Server failure';
}

final class SearchingForBooksFailure extends Equatable implements Failure {
  @override
  String userMessage() => 'Something went wrong when searching books';

  @override
  List<Object> get props => [];
}
