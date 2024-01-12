import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/repositories/books_repository.dart';
import '../repositories/external_books_repository.dart';

typedef SearchForBooks = UseCase<List<Book>, SearchParams>;

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

final class SearchParams extends Equatable {
  const SearchParams({required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}
