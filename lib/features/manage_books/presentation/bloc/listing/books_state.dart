part of 'books_bloc.dart';

@immutable
final class BooksState extends Equatable {
  const BooksState({required this.books, required this.value});

  const BooksState.initial()
      : books = const [],
        value = StateValue.initial;

  const BooksState.booksLoaded(this.books) : value = StateValue.booksLoaded;

  const BooksState.loadingFailed()
      : books = const [],
        value = StateValue.loadingFailed;

  const BooksState.addingBookFailed()
      : books = const [],
        value = StateValue.addingBookFailed;

  const BooksState.updatingBookFailed()
      : books = const [],
        value = StateValue.updatingBookFailed;

  final List<Book> books;

  final StateValue value;

  @override
  List<Object> get props => [books];
}

enum StateValue {
  initial,
  booksLoaded,
  loadingFailed,
  addingBookFailed,
  updatingBookFailed,
}
