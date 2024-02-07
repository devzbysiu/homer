import 'package:equatable/equatable.dart';
import 'package:multiple_result/multiple_result.dart';

import '../../../../core/entities/book.dart';
import '../../../../core/error/failures.dart';
import '../../../../core/usecase/usecase.dart';
import '../repositories/external_books_repository.dart';

typedef FetchSharedBook = UseCase<Book, FetchBookParams>;

final class FetchSharedBookImpl implements FetchSharedBook {
  FetchSharedBookImpl(this.booksRepo);

  final ExternalBooksRepository booksRepo;

  // TODO: Add check if book is already saved
  @override
  Future<Result<Book, Failure>> call(FetchBookParams params) async {
    return booksRepo.fromIsbn(params.isbn);
  }
}

final class FetchBookParams extends Equatable {
  const FetchBookParams({required this.isbn});

  final String isbn;

  @override
  List<Object> get props => [isbn];
}
