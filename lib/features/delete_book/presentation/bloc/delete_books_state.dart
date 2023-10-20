part of 'delete_books_bloc.dart';

@immutable
abstract class DeleteBooksState extends Equatable {
  const DeleteBooksState({required this.deletionList});

  final List<LocalBook> deletionList;

  @override
  List<Object> get props => [deletionList];
}

final class Empty extends DeleteBooksState {
  const Empty() : super(deletionList: const []);
}

final class DeletionList extends DeleteBooksState {
  const DeletionList({required super.deletionList});
}

final class CleanDeletionList extends DeleteBooksState {
  const CleanDeletionList() : super(deletionList: const []);
}

final class FailedToLoadBooks extends DeleteBooksState {
  const FailedToLoadBooks() : super(deletionList: const []);
}

final class BooksRemoved extends DeleteBooksState {
  const BooksRemoved() : super(deletionList: const []);
}
