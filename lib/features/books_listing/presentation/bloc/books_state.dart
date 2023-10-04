part of 'books_bloc.dart';

@immutable
abstract class BooksState {
  const BooksState({required this.books});

  final List<BookEntity> books;
}

final class Empty extends BooksState {
  const Empty() : super(books: const []);
}

final class BooksLoaded extends BooksState {
  const BooksLoaded(List<BookEntity> books) : super(books: books);
}

final class FailedToLoadBooks extends BooksState {
  const FailedToLoadBooks() : super(books: const []);
}
