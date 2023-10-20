part of 'delete_books_bloc.dart';

@immutable
abstract class DeleteBooksEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class AppendToDeleteList extends DeleteBooksEvent {
  AppendToDeleteList(this.book);

  final LocalBook book;

  @override
  List<Object> get props => [book];
}

final class RemoveFromDeleteList extends DeleteBooksEvent {
  RemoveFromDeleteList(this.book);

  final LocalBook book;

  @override
  List<Object> get props => [book];
}

final class DeleteBooks extends DeleteBooksEvent {
  DeleteBooks(this.books);

  final List<LocalBook> books;

  @override
  List<Object> get props => [books];
}

final class ClearDeletionList extends DeleteBooksEvent {}
