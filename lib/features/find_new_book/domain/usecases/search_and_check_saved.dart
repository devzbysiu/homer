import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../manage_books/domain/repositories/books_repository.dart';
import '../repositories/external_books_repository.dart';
import 'search_for_books.dart';

final class SearchAndCheckSaved implements SearchForBooks {
  SearchAndCheckSaved(this.externalBooksRepo, this.booksRepo);

  final ExternalBooksRepository externalBooksRepo;

  final BooksRepository booksRepo;

  @override
  Future<Result<List<Book>, Failure>> call(SearchParams params) async {
    final foundResult = await externalBooksRepo.search(params.query);
    if (foundResult.isError()) return Error(foundResult.tryGetError()!);
    final foundBooks = foundResult.tryGetSuccess()!;

    final savedResult = await booksRepo.listAll();
    if (savedResult.isError()) return Error(savedResult.tryGetError()!);
    final savedBooks = savedResult.tryGetSuccess()!;

    return Success(markAlreadySavedBooks(foundBooks, savedBooks));
  }

  List<Book> markAlreadySavedBooks(List<Book> found, List<Book> saved) {
    final savedTitles = saved.map((book) => book.title).toSet();
    return found
        .map((b) => b.copyWith(alreadySaved: savedTitles.contains(b.title)))
        .toList();
  }
}
