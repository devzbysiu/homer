import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/external_books_repository.dart';

typedef SearchForBooks = UseCase<List<Book>, SearchParams>;

final class SearchForBooksImpl implements SearchForBooks {
  SearchForBooksImpl(this.booksRepo);

  final ExternalBooksRepository booksRepo;

  @override
  Future<Result<List<Book>, Failure>> call(SearchParams params) async {
    return await booksRepo.search(params.query);
  }
}

final class SearchParams extends Equatable {
  const SearchParams({required this.query});

  final String query;

  @override
  List<Object> get props => [query];
}
