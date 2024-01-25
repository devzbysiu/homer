import 'package:collection/collection.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/repositories/books_repository.dart';
import '../entities/books_per_state_data.dart';

typedef LoadBooksPerState = UseCase<BooksPerStateData, NoParams>;

final class LoadBooksPerStateImpl implements LoadBooksPerState {
  LoadBooksPerStateImpl(this.repo);

  final BooksRepository repo;

  @override
  Future<Result<BooksPerStateData, Failure>> call(NoParams params) async {
    final result = await repo.listAll();
    if (result.isError()) return Error(result.tryGetError()!);
    final books = result.tryGetSuccess()!;
    final states = _groupByState(books);
    final counts = states.map(
      (state, books) => MapEntry(ComparableBookState(state), books.length),
    );
    return Success(BooksPerStateData(counts));
  }

  Map<BookState, List<Book>> _groupByState(List<Book> books) {
    return groupBy(books, (b) => b.state);
  }
}
