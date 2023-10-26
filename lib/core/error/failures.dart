abstract class Failure {
  String userMessage();
}

final class InvalidUrlSharedFailure implements Failure {
  const InvalidUrlSharedFailure(this.url);

  final String url;

  @override
  String toString() => 'This is not correct URL: $url';

  @override
  String userMessage() => toString();
}

final class NoIsbnFailure implements Failure {
  const NoIsbnFailure(this.url);

  final String url;

  @override
  String userMessage() => 'No ISBN found on shared page: $url';
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
