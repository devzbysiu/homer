import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../../../core/entities/book.dart';

part 'books_state.freezed.dart';

@freezed
sealed class BooksState with _$BooksState {
  const BooksState._(); // enables instance methods / helpers

  const factory BooksState.initial({@Default(<Book>[]) List<Book> books}) =
      Initial;

  const factory BooksState.booksLoaded(List<Book> books) = BooksLoaded;

  const factory BooksState.loadingFailed() = LoadingFailed;
  const factory BooksState.addingBookFailed() = AddingBookFailed;
  const factory BooksState.updatingBookFailed() = UpdatingBookFailed;

  List<Book> get booksOrEmpty => maybeWhen(
    initial: (b) => b,
    booksLoaded: (b) => b,
    orElse: () => const <Book>[],
  );
}
