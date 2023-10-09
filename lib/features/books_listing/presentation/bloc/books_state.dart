part of 'books_bloc.dart';

@immutable
abstract class BooksState {
  const BooksState({
    required this.books,
    required this.deleteList,
  });

  final List<LocalBook> books;

  final List<LocalBook> deleteList;
}

final class Empty extends BooksState {
  const Empty() : super(books: const [], deleteList: const []);
}

final class BooksLoaded extends BooksState {
  const BooksLoaded({required super.books, required super.deleteList});
}

final class FailedToLoadBooks extends BooksState {
  const FailedToLoadBooks() : super(books: const [], deleteList: const []);
}

class DeletionList extends BooksState {
  const DeletionList({required super.deleteList, required super.books});
}
