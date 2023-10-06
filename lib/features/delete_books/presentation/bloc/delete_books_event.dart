part of 'delete_books_bloc.dart';

abstract class DeleteBooksEvent extends Equatable {}

final class PickedForDeletion extends DeleteBooksEvent {
  PickedForDeletion(this.book);

  final Book book;

  @override
  List<Object> get props => [book];
}

final class DeleteBooks extends DeleteBooksEvent {
  DeleteBooks(this.books);

  final List<Book> books;

  @override
  List<Object?> get props => [books];
}
