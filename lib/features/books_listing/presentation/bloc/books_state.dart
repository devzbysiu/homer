part of 'books_bloc.dart';

@immutable
abstract class BooksState extends Equatable {
  const BooksState({required this.books});

  final List<LocalBook> books;

  @override
  List<Object> get props => [books];
}

final class Empty extends BooksState {
  const Empty() : super(books: const []);
}

final class BooksLoaded extends BooksState {
  const BooksLoaded({required super.books});
}

final class FailedToLoadBooks extends BooksState {
  const FailedToLoadBooks() : super(books: const []);
}
