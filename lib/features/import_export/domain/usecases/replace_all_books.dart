import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../../../manage_books/domain/repositories/books_repository.dart';

typedef ReplaceAllBooks = UseCase<Unit, ReplaceParams>;

final class ReplaceAllBooksImpl implements ReplaceAllBooks {
  ReplaceAllBooksImpl(this.booksRepo);

  final BooksRepository booksRepo;

  @override
  Future<Result<Unit, Failure>> call(ReplaceParams params) async {
    return booksRepo.replaceAll(params.books);
  }
}

final class ReplaceParams extends Equatable {
  const ReplaceParams({required this.books});

  final List<Book> books;

  @override
  List<Object> get props => [books];
}
