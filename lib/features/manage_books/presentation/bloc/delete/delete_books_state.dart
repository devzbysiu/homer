import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/book.dart';

part 'delete_books_state.freezed.dart';

@freezed
class DeleteBooksState with _$DeleteBooksState {
  const DeleteBooksState._(); // enables instance methods

  const factory DeleteBooksState.initial({
    @Default(<Book>[]) List<Book> deletionList,
  }) = Initial;

  const factory DeleteBooksState.deletionList(List<Book> deletionList) =
      DeletionList;
  const factory DeleteBooksState.booksRemoved() = BooksRemoved;
  const factory DeleteBooksState.deletionListCleared() = DeletionListCleared;
  const factory DeleteBooksState.deletionFailed() = DeletionFailed;

  List<Book> get deletionListOrEmpty => maybeWhen(
    initial: (l) => l,
    deletionList: (l) => l,
    orElse: () => const <Book>[],
  );

  bool get hasSelection => deletionListOrEmpty.isNotEmpty;
}
