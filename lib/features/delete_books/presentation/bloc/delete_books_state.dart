part of 'delete_books_bloc.dart';

abstract class DeleteBooksState extends Equatable {
  const DeleteBooksState({required this.books});

  final List<Book> books;

  @override
  List<Object> get props => [books];
}

class Empty extends DeleteBooksState {
  const Empty() : super(books: const []);
}

class DeletionList extends DeleteBooksState {
  const DeletionList({required super.books});
}
