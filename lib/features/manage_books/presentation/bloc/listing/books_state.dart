part of 'books_bloc.dart';

@immutable
abstract class BooksState extends Equatable {
  const BooksState({this.books = const []});

  final List<Book> books;

  @override
  List<Object> get props => [books];
}

final class Empty extends BooksState {}

final class BooksLoaded extends BooksState {
  const BooksLoaded({required super.books});
}

final class FailedToLoadBooks extends BooksState {}
