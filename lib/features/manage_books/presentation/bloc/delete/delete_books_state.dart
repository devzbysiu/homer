part of 'delete_books_bloc.dart';

@immutable
final class DeleteBooksState extends Equatable {
  const DeleteBooksState.initial()
      : deletionList = const [],
        value = Value.initial;

  const DeleteBooksState.deletionList(this.deletionList)
      : value = Value.deletionList;

  const DeleteBooksState.booksRemoved()
      : deletionList = const [],
        value = Value.booksRemoved;

  const DeleteBooksState.deletionListCleared()
      : deletionList = const [],
        value = Value.deletionListCleared;

  const DeleteBooksState.deletionFailed()
      : deletionList = const [],
        value = Value.deletionFailed;

  final List<Book> deletionList;

  final Value value;

  @override
  List<Object> get props => [deletionList];
}

enum Value {
  initial,
  deletionList,
  booksRemoved,
  deletionListCleared,
  deletionFailed,
}
