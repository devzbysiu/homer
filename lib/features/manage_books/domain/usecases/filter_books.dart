import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../../core/utils/books_sort.dart';
import '../repositories/books_repository.dart';

typedef FilterBooks = UseCase<List<Book>, FilterParams>;

final class FilterBooksImpl implements FilterBooks {
  FilterBooksImpl(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<List<Book>, Failure>> call(FilterParams params) async {
    final listResult = await booksRepo.listAll();
    return listResult.when(
      (books) => Success(_filter(books, params.query)),
      (error) => Error(error),
    );
  }

  List<Book> _filter(List<Book> books, String query) {
    final lowercaseQuery = query.toLowerCase();
    final matchingBooks =
        books
            .where(
              (book) =>
                  book.title.toLowerCase().contains(lowercaseQuery) ||
                  book.subtitle.toLowerCase().contains(lowercaseQuery) ||
                  book.summary.getOrElse(() => '').contains(lowercaseQuery),
            )
            .toList();
    return sortByStateAndDate(matchingBooks);
  }
}

final class FilterParams extends Equatable {
  const FilterParams({required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}
