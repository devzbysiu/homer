part of 'delete_books_bloc.dart';

@immutable
abstract class DeleteBooksEvent extends Equatable implements BusEvent {
  @override
  List<Object> get props => [];
}

final class DeletePickedBooks extends DeleteBooksEvent {}

final class ClearDeletionList extends DeleteBooksEvent {}

final class DeleteModeToggled extends DeleteBooksEvent {
  DeleteModeToggled(this.book);

  final Book book;

  @override
  List<Object> get props => [book];
}
