part of 'books_bloc.dart';

@immutable
abstract class BooksState extends Equatable {
  const BooksState({
    required this.books,
    required this.deleteList,
    this.bookInSummaryMode = const None(),
  });

  final List<LocalBook> books;

  final List<LocalBook> deleteList;

  final Option<LocalBook> bookInSummaryMode;

  @override
  List<Object> get props => [books, deleteList, bookInSummaryMode];
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

final class DeletionList extends BooksState {
  const DeletionList({required super.deleteList, required super.books});
}

final class BookInSummaryMode extends BooksState {
  const BookInSummaryMode({
    required super.deleteList,
    required super.books,
    required super.bookInSummaryMode,
  });
}
