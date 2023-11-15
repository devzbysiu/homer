part of 'delete_books_bloc.dart';

@immutable
abstract class DeleteBooksEvent extends Equatable {
  @override
  List<Object> get props => [];
}

final class DeletePickedBooks extends DeleteBooksEvent {
  DeletePickedBooks();

  @override
  List<Object> get props => [];
}

final class ClearDeletionList extends DeleteBooksEvent {}

final class ToggleBookOnDeleteList extends DeleteBooksEvent {
  ToggleBookOnDeleteList(this.book);

  final Book book;
}
