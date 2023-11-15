part of 'delete_books_bloc.dart';

@immutable
abstract class DeleteBooksState extends Equatable {
  const DeleteBooksState({this.deletionList = const []});

  final List<Book> deletionList;

  @override
  List<Object> get props => [deletionList];
}

final class Empty extends DeleteBooksState {}

final class DeletionList extends DeleteBooksState {
  const DeletionList({required super.deletionList});
}

final class CleanDeletionList extends DeleteBooksState {}

final class FailedToLoadBooks extends DeleteBooksState {}

final class BooksRemoved extends DeleteBooksState {}
